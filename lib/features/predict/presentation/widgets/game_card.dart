import 'package:flutter/material.dart';

import '../../../../core/domain/game.dart';
import '../../../../core/domain/team.dart';
import 'game_team.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.game,
    required this.winner,
    required this.onChange,
    required this.onWinnerSelected,
  });

  final GameWithResult game;
  final Team? winner;
  final void Function(int gameId, Team team, int? value) onChange;
  final ValueChanged<Team> onWinnerSelected;

  @override
  Widget build(BuildContext context) {
    final tied = game.team1Score != null && game.team1Score == game.team2Score;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      child: Column(
        children: [
          GameTeamRow(
            score: game.team1Score,
            team: game.team1,
            tied: tied,
            winner: winner,
            gameId: game.gameId,
            onScoreChange: onChange,
            onWinnerSelected: onWinnerSelected,
          ),
          GameTeamRow(
            score: game.team2Score,
            team: game.team2,
            tied: tied,
            winner: winner,
            gameId: game.gameId,
            onScoreChange: onChange,
            onWinnerSelected: onWinnerSelected,
          ),
        ],
      ),
    );
  }
}
