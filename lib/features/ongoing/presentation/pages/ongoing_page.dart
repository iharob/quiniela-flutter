import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quiniela_flutter/core/domain/user_results.dart';
import 'package:quiniela_flutter/shared/widgets/avatar.dart';
import 'package:quiniela_flutter/shared/widgets/list_item_separator.dart';
import 'package:quiniela_flutter/shared/widgets/team_item.dart';
import 'package:quiniela_flutter/features/session/bloc/session_cubit.dart';
import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';
import 'package:quiniela_flutter/features/ongoing/presentation/bloc/ongoing_cubit.dart';
import 'package:quiniela_flutter/features/ongoing/presentation/bloc/ongoing_state.dart';

class OngoingPage extends StatefulWidget {
  const OngoingPage({super.key});

  @override
  State<OngoingPage> createState() => _OngoingPageState();
}

class _OngoingPageState extends State<OngoingPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<OngoingCubit>().refresh();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<OngoingCubit>().refresh();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  bool _isExactMatch(UserResult result, LiveScore? live) {
    if (live == null) return false;
    return result.team1Score == live.team1Score &&
        result.team2Score == live.team2Score;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OngoingCubit, OngoingState>(
      builder: (context, state) {
        final session = context.read<SessionCubit>().currentSession;
        final currentUserId = session?.userId ?? -1;
        if (state.groups.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => context.read<OngoingCubit>().refresh(),
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: const ListEmptyMessage(
                    message: 'No hay partidos en este momento',
                  ),
                ),
              ],
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: () => context.read<OngoingCubit>().refresh(),
          child: ListView.builder(
            itemCount: state.groups.length,
            itemBuilder: (context, index) {
              final group = state.groups[index];
              final self = group.groupResults
                  .where((r) => r.user.id == currentUserId)
                  .firstOrNull;
              final others = group.groupResults
                  .where((r) => r.user.id != currentUserId)
                  .toList();
              return _OngoingSection(
                group: group,
                self: self,
                others: others,
                isExactMatch: _isExactMatch,
              );
            },
          ),
        );
      },
    );
  }
}

extension<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}

class _OngoingSection extends StatelessWidget {
  const _OngoingSection({
    required this.group,
    required this.self,
    required this.others,
    required this.isExactMatch,
  });

  final GameResultGroup group;
  final UserResult? self;
  final List<UserResult> others;
  final bool Function(UserResult, LiveScore?) isExactMatch;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SectionHeader(
          group: group,
          self: self,
          isExactMatch: isExactMatch,
        ),
        if (group.liveScore != null)
          Container(
            color: tournament.dimmedCardColor,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 100,
                  alignment: Alignment.center,
                  child: Text(
                    '${group.liveScore!.team1Score}',
                    style: TextStyle(
                      color: tournament.primaryColorBright,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      group.liveScore!.status.isEmpty
                          ? 'EN VIVO'
                          : group.liveScore!.status,
                      style: TextStyle(
                        color: tournament.primaryColor,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  alignment: Alignment.center,
                  child: Text(
                    '${group.liveScore!.team2Score}',
                    style: TextStyle(
                      color: tournament.primaryColorBright,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        for (final other in others)
          _UserRow(
            result: other,
            highlight: false,
            exactMatch: isExactMatch(other, group.liveScore),
          ),
        const ListItemSeparator(),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.group,
    required this.self,
    required this.isExactMatch,
  });

  final GameResultGroup group;
  final UserResult? self;
  final bool Function(UserResult, LiveScore?) isExactMatch;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return Container(
      color: tournament.cardColor,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: TeamItem(
                    team: group.team1,
                    orientation: TeamItemOrientation.vertical,
                    variant: TeamItemVariant.light,
                  ),
                ),
                Expanded(
                  child: Text(
                    'USUARIO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: tournament.contrastTextColor.withValues(alpha: 0.75),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: TeamItem(
                    team: group.team2,
                    orientation: TeamItemOrientation.vertical,
                    variant: TeamItemVariant.light,
                  ),
                ),
              ],
            ),
          ),
          if (self != null)
            _UserRow(
              result: self!,
              highlight: true,
              exactMatch: isExactMatch(self!, group.liveScore),
            ),
        ],
      ),
    );
  }
}

class _UserRow extends StatelessWidget {
  const _UserRow({
    required this.result,
    required this.highlight,
    required this.exactMatch,
  });

  final UserResult result;
  final bool highlight;
  final bool exactMatch;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    final color =
        highlight ? tournament.contrastTextColor : tournament.textColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '${result.team1Score}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Avatar(name: result.user.name, uri: result.user.photoUrl, size: 28),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    result.user.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: color),
                  ),
                ),
                if (exactMatch)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Icon(Icons.check,
                        color: tournament.primaryColorBright, size: 14),
                  ),
              ],
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              '${result.team2Score}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
