import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/domain/game.dart';
import '../../../../core/domain/team.dart';
import '../../../../core/utils/brackets.dart';
import '../../../../core/utils/simulate.dart';
import '../../../../core/utils/winner.dart';
import '../../../../shared/widgets/hamburger_menu.dart';
import '../../../../shared/widgets/styled_button.dart';
import '../bloc/knockout_cubit.dart';
import '../widgets/game_group.dart';
import 'knockout_nav_args.dart';

const Map<int, String> _roundNames = {
  16: 'Dieciseisavos',
  8: 'Octavos',
  4: 'Cuartos',
  2: 'Semi-Final',
  1: 'Final',
};

class KnockoutPage extends StatefulWidget {
  const KnockoutPage({super.key, required this.args});

  final KnockoutNavArgs args;

  @override
  State<KnockoutPage> createState() => _KnockoutPageState();
}

class _KnockoutPageState extends State<KnockoutPage> {
  late List<List<GameWithResult>> _pairs;

  @override
  void initState() {
    super.initState();
    final stored = context.read<KnockoutCubit>().state.rounds[widget.args.round];
    final source =
        (stored != null && stored.isNotEmpty) ? stored : widget.args.games;
    _pairs = AppConfig.simulate ? _simulatePairs(source) : _clonePairs(source);
  }

  List<List<GameWithResult>> _clonePairs(
    List<List<GameWithResult>> source,
  ) =>
      source.map((p) => List<GameWithResult>.from(p)).toList();

  List<List<GameWithResult>> _simulatePairs(
    List<List<GameWithResult>> source,
  ) {
    final sim = Simulator.instance;
    return source.map((pair) {
      final s1 = sim.simulateScore(pair[0].team1, pair[0].team2);
      final s2 = sim.simulateScore(pair[1].team1, pair[1].team2);
      return [
        pair[0].copyWith(
          team1Score: s1.team1Score,
          team2Score: s1.team2Score,
          winner: s1.winner,
        ),
        pair[1].copyWith(
          team1Score: s2.team1Score,
          team2Score: s2.team2Score,
          winner: s2.winner,
        ),
      ];
    }).toList();
  }

  void _onScoreChange(int gameId, Team team, int? value) {
    setState(() {
      _pairs = _pairs.map((pair) {
        GameWithResult update(GameWithResult game) {
          if (game.gameId != gameId) return game;
          return team.country == game.team1.country
              ? game.copyWith(team1Score: value, winner: null)
              : game.copyWith(team2Score: value, winner: null);
        }

        return [update(pair[0]), update(pair[1])];
      }).toList();
    });
  }

  void _onWinnerSelected(Team winner) {
    setState(() {
      _pairs = _pairs.map((pair) {
        GameWithResult assign(GameWithResult game) {
          if (game.team1.country == winner.country ||
              game.team2.country == winner.country) {
            return game.copyWith(winner: winner);
          }
          return game;
        }

        return [assign(pair[0]), assign(pair[1])];
      }).toList();
    });
  }

  int get _completed {
    var count = 0;
    for (final pair in _pairs) {
      if (getWinner(pair[0]).country != 'NA') count += 1;
      if (getWinner(pair[1]).country != 'NA') count += 1;
    }
    return count;
  }

  int get _total => widget.args.games.length * 2;

  Future<void> _handleNext() async {
    final knockout = context.read<KnockoutCubit>();
    await knockout.updateRound(widget.args.round, _pairs);

    final nextApiRound = widget.args.round - 1;
    final nextRound =
        findRound(knockout.state.bracketFixtures, nextApiRound);
    if (nextRound == null) {
      debugPrint('No bracket fixtures found for round $nextApiRound');
      return;
    }
    final nextGames = buildNextRoundGames(_pairs, nextRound.matches);
    if (nextGames.length == 1) {
      if (!mounted) return;
      context.push('/predict/final', extra: nextGames.first);
      return;
    }

    final after = findRound(knockout.state.bracketFixtures, nextApiRound - 1);
    if (after == null) {
      debugPrint('No bracket fixtures found for round ${nextApiRound - 1}');
      return;
    }
    final nextPairs = pairGamesByFeeders(nextGames, after.matches);
    final pairs = AppConfig.simulate ? _simulatePairs(nextPairs) : nextPairs;

    if (!mounted) return;
    context.push(
      '/predict/knockout',
      extra: KnockoutNavArgs(round: nextApiRound, games: pairs),
    );
  }

  @override
  Widget build(BuildContext context) {
    final roundLabel = _roundNames[_total] ?? '-';
    return Scaffold(
      appBar: AppBar(
        title: Text('$roundLabel $_completed/$_total'),
        actions: const [HamburgerMenu()],
      ),
      body: ListView.separated(
        itemCount: _pairs.length,
        separatorBuilder: (_, __) => Container(
          height: 1,
          color: const Color(0x26FFFFFF),
        ),
        itemBuilder: (context, index) => GameGroupView(
          pair: _pairs[index],
          onChange: _onScoreChange,
          onWinnerSelected: _onWinnerSelected,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Center(
          child: NextButton(
            disabled: _total != _completed,
            onNext: _total == _completed ? _handleNext : null,
          ),
        ),
      ),
    );
  }
}
