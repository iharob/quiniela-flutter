import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/data/api_client.dart';
import '../../../../core/domain/classification.dart';
import '../../../../core/utils/brackets.dart';
import '../../../../shared/widgets/hamburger_menu.dart';
import '../../../../shared/widgets/spinner_overlay.dart';
import '../../../../shared/widgets/styled_button.dart';
import '../bloc/groups_cubit.dart';
import '../bloc/groups_state.dart';
import '../bloc/knockout_cubit.dart';
import '../widgets/group_accordion_row.dart';
import 'knockout_nav_args.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  String? _expandedGroup;
  bool _didInitExpansion = false;
  bool _computingDraw = false;

  @override
  void initState() {
    super.initState();
    context.read<GroupsCubit>().load();
  }

  Future<void> _handleNext() async {
    final cubit = context.read<GroupsCubit>();
    final knockout = context.read<KnockoutCubit>();
    final api = context.read<ApiClient>();

    setState(() => _computingDraw = true);
    try {
      final brackets = await api.computeBrackets(cubit.state.groups);
      final round32 = findRound(brackets, 5);
      final round16 = findRound(brackets, 4);
      if (round32 == null || round16 == null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'La respuesta del sorteo no contiene las rondas esperadas'),
          ),
        );
        return;
      }
      final pairs = pairMatchesByFeeders(round32.matches, round16.matches);
      knockout.setBracketFixtures(brackets);
      if (!mounted) return;
      context.push(
        '/predict/knockout',
        extra: KnockoutNavArgs(round: 5, games: pairs),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No se pudo calcular los partidos. Intente de nuevo.'),
        ),
      );
    } finally {
      if (mounted) setState(() => _computingDraw = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupsCubit, GroupsState>(
      builder: (context, state) {
        final cubit = context.read<GroupsCubit>();
        if (!_didInitExpansion && state.groups.isNotEmpty) {
          _didInitExpansion = true;
          _expandedGroup = state.groups.first.name;
        }
        final positionsByName = <String, ClassificationGroup>{
          for (final p in state.positions) p.name: p,
        };
        return Scaffold(
          appBar: AppBar(
            title: Text('Completado ${cubit.completed}/${cubit.total}'),
            actions: const [HamburgerMenu()],
          ),
          body: Stack(
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.groups.length,
                itemBuilder: (context, index) {
                  final group = state.groups[index];
                  final expanded = _expandedGroup == group.name;
                  final dimmed = _expandedGroup != null && !expanded;
                  return GroupAccordionRow(
                    group: group,
                    classification: positionsByName[group.name],
                    expanded: expanded,
                    dimmed: dimmed,
                    onToggle: (name) {
                      setState(() {
                        _expandedGroup = _expandedGroup == name ? null : name;
                      });
                    },
                    onScoreChange: (gameId, team, value) {
                      cubit.updateGameScore(
                        gameId: gameId,
                        team: team,
                        value: value,
                      );
                    },
                  );
                },
              ),
              SpinnerOverlay(visible: state.loading || _computingDraw),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Center(
              child: NextButton(
                disabled: cubit.completed < cubit.total,
                onNext: cubit.completed == cubit.total ? _handleNext : null,
              ),
            ),
          ),
        );
      },
    );
  }
}

