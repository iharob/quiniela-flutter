import 'package:flutter/material.dart';

import '../../../../core/domain/classification.dart';
import '../../../../core/domain/game.dart';
import '../../../../core/domain/group.dart';
import '../../../../core/domain/team.dart';
import '../../../../shared/widgets/score_input.dart';
import '../../../../shared/widgets/team_item.dart';
import '../../../theme/domain/tournament_theme.dart';
import 'group_classification_table.dart';

const double _gameRowHeight = 50;

enum _Tab { games, standings }

class GroupAccordionRow extends StatefulWidget {
  const GroupAccordionRow({
    super.key,
    required this.group,
    this.classification,
    required this.expanded,
    required this.dimmed,
    required this.onToggle,
    required this.onScoreChange,
  });

  final GroupWithResults group;
  final ClassificationGroup? classification;
  final bool expanded;
  final bool dimmed;
  final ValueChanged<String> onToggle;
  final void Function(int gameId, Team team, int? value) onScoreChange;

  @override
  State<GroupAccordionRow> createState() => _GroupAccordionRowState();
}

class _GroupAccordionRowState extends State<GroupAccordionRow> {
  _Tab _activeTab = _Tab.games;

  int get _completed {
    var count = 0;
    for (final game in widget.group.games) {
      if (game.team1Score != null && game.team2Score != null) count += 1;
    }
    return count;
  }

  int get _total => widget.group.games.length;
  bool get _isComplete => _total > 0 && _completed == _total;
  double get _percentage => _total == 0 ? 0 : _completed / _total;

  double? _standingsRowHeight() {
    final teamCount = widget.classification?.entries.length ?? 0;
    if (teamCount == 0) return null;
    return (_gameRowHeight * _total - 30 - (teamCount - 1)) / teamCount;
  }

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return Opacity(
      opacity: widget.dimmed ? 0.45 : 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: tournament.borderColor, width: 0.5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () => widget.onToggle(widget.group.name),
              child: Container(
                color: tournament.backgroundColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Grupo ${widget.group.name}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: tournament.textColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: _ProgressBar(percentage: _percentage),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 36,
                      child: Text(
                        '$_completed/$_total',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: tournament.textColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: _isComplete
                          ? Icon(Icons.check,
                              color: tournament.primaryColorBright, size: 18)
                          : null,
                    ),
                  ],
                ),
              ),
            ),
            if (widget.expanded) _buildBody(tournament),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(TournamentTheme tournament) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: tournament.borderColor, width: 0.5),
            ),
          ),
          child: Row(
            children: [
              _TabButton(
                label: 'PARTIDOS',
                active: _activeTab == _Tab.games,
                onTap: () => setState(() => _activeTab = _Tab.games),
              ),
              _TabButton(
                label: 'POSICIONES',
                active: _activeTab == _Tab.standings,
                onTap: () => setState(() => _activeTab = _Tab.standings),
              ),
            ],
          ),
        ),
        if (_activeTab == _Tab.games)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              children: [
                for (final game in widget.group.games)
                  _GameRow(
                    game: game,
                    onScoreChange: widget.onScoreChange,
                  ),
              ],
            ),
          )
        else if (widget.classification != null)
          GroupClassificationTable(
            group: widget.classification!,
            rowHeight: _standingsRowHeight(),
          ),
      ],
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.percentage});
  final double percentage;
  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    final isComplete = percentage == 1;
    return SizedBox(
      height: 6,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0x14000000),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: percentage.clamp(0.0, 1.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isComplete
                    ? tournament.primaryColorBright
                    : tournament.primaryColor,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.label,
    required this.active,
    required this.onTap,
  });
  final String label;
  final bool active;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: active ? tournament.primaryColor : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Center(
            child: Opacity(
              opacity: active ? 1 : 0.55,
              child: Text(
                label,
                style: TextStyle(
                  color: tournament.textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GameRow extends StatelessWidget {
  const _GameRow({required this.game, required this.onScoreChange});

  final GameWithResult game;
  final void Function(int gameId, Team team, int? value) onScoreChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gameRowHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(child: TeamItem(team: game.team1)),
            const SizedBox(width: 12),
            ScoreInput(
              value: game.team1Score,
              team: game.team1,
              gameId: game.gameId,
              onChange: onScoreChange,
            ),
            const SizedBox(width: 10),
            ScoreInput(
              value: game.team2Score,
              team: game.team2,
              gameId: game.gameId,
              onChange: onScoreChange,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TeamItem(
                team: game.team2,
                direction: TeamItemDirection.reverse,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
