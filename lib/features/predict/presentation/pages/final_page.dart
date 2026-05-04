import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/data/api_client.dart';
import '../../../../core/domain/game.dart';
import '../../../../core/domain/team.dart';
import '../../../../core/utils/simulate.dart';
import '../../../../core/utils/winner.dart';
import '../../../../shared/widgets/hamburger_menu.dart';
import '../../../../shared/widgets/spinner_overlay.dart';
import '../../../../shared/widgets/styled_button.dart';
import '../../../../shared/widgets/team_flag.dart';
import '../../../session/bloc/session_cubit.dart';
import '../../../theme/domain/tournament_theme.dart';
import '../bloc/groups_cubit.dart';
import '../bloc/knockout_cubit.dart';
import '../widgets/game_card.dart';

class FinalPage extends StatefulWidget {
  const FinalPage({super.key, required this.initialGame});

  final GameWithResult initialGame;

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  late GameWithResult _game;
  bool _processing = false;

  @override
  void initState() {
    super.initState();
    if (AppConfig.simulate) {
      final sim =
          Simulator.instance.simulateScore(widget.initialGame.team1, widget.initialGame.team2);
      _game = widget.initialGame.copyWith(
        team1Score: sim.team1Score,
        team2Score: sim.team2Score,
        winner: sim.winner,
      );
    } else {
      _game = widget.initialGame;
    }
  }

  void _onChange(int gameId, Team team, int? value) {
    setState(() {
      _game = team.country == _game.team1.country
          ? _game.copyWith(team1Score: value, winner: null)
          : _game.copyWith(team2Score: value, winner: null);
    });
  }

  void _onWinnerSelected(Team team) {
    setState(() => _game = _game.copyWith(winner: team));
  }

  Future<void> _submit() async {
    final groups = context.read<GroupsCubit>();
    final knockout = context.read<KnockoutCubit>();
    final api = context.read<ApiClient>();
    final session = context.read<SessionCubit>();

    setState(() => _processing = true);
    try {
      await api.sendPrediction(
        groups: groups.state.groups,
        knockout: knockout.state.rounds,
        finalGame: _game,
      );
      await session.markPredicted();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _processing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final winner = getWinner(_game);
    final tournament = context.tournamentTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Final'),
        actions: const [HamburgerMenu()],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              GameCard(
                game: _game,
                winner: winner,
                onChange: _onChange,
                onWinnerSelected: _onWinnerSelected,
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (winner.country != 'NA')
                        TeamFlag(
                          country: winner.country,
                          width: (4 * 70) / 3,
                          height: 70,
                        ),
                      const SizedBox(height: 16),
                      Text(
                        winner.name,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: tournament.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: StyledButton(
                    label: 'Aceptar y Enviar',
                    onPressed: _processing ? null : _submit,
                    disabled: _processing,
                  ),
                ),
              ),
            ],
          ),
          SpinnerOverlay(visible: _processing),
        ],
      ),
    );
  }
}
