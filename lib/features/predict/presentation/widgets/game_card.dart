import 'package:flutter/material.dart';

import 'package:quiniela_flutter/core/domain/game.dart';
import 'package:quiniela_flutter/core/domain/team.dart';
import 'package:quiniela_flutter/features/predict/presentation/widgets/game_team.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.game,
    required this.winner,
    required this.onChange,
    required this.onWinnerSelected,
    this.padding = const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
  });

  final GameWithResult game;
  final Team? winner;
  final void Function(int gameId, Team team, int? value) onChange;
  final ValueChanged<Team> onWinnerSelected;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final tied = game.team1Score != null && game.team1Score == game.team2Score;
    return Padding(
      padding: padding,
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
