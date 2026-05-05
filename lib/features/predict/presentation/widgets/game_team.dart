import 'package:flutter/material.dart';

import 'package:quiniela_flutter/core/domain/team.dart';
import 'package:quiniela_flutter/shared/widgets/score_input.dart';
import 'package:quiniela_flutter/shared/widgets/team_item.dart';
import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';

class GameTeamRow extends StatelessWidget {
  const GameTeamRow({
    super.key,
    required this.score,
    required this.team,
    required this.tied,
    required this.winner,
    required this.gameId,
    required this.onScoreChange,
    required this.onWinnerSelected,
  });

  final int? score;
  final Team team;
  final bool tied;
  final Team? winner;
  final int gameId;
  final void Function(int gameId, Team team, int? value) onScoreChange;
  final ValueChanged<Team> onWinnerSelected;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    final checked = winner?.country == team.country;
    final disabled = !tied;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Opacity(
            opacity: disabled ? 0.35 : 1,
            child: Radio<bool>(
              value: true,
              groupValue: checked ? true : null,
              fillColor: WidgetStateProperty.all(tournament.primaryColorBright),
              onChanged: disabled ? null : (_) => onWinnerSelected(team),
            ),
          ),
          Expanded(child: TeamItem(team: team)),
          ScoreInput(
            value: score,
            team: team,
            gameId: gameId,
            onChange: onScoreChange,
          ),
        ],
      ),
    );
  }
}
