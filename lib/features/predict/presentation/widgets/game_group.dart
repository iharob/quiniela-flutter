import 'package:flutter/material.dart';

import '../../../../core/domain/game.dart';
import '../../../../core/domain/team.dart';
import '../../../../core/utils/winner.dart';
import '../../../../shared/widgets/team_item.dart';
import '../../../theme/domain/tournament_theme.dart';
import 'game_card.dart';

class GameGroupView extends StatelessWidget {
  const GameGroupView({
    super.key,
    required this.pair,
    required this.onChange,
    required this.onWinnerSelected,
  });

  final List<GameWithResult> pair;
  final void Function(int gameId, Team team, int? value) onChange;
  final ValueChanged<Team> onWinnerSelected;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    final winner1 = getWinner(pair[0]);
    final winner2 = getWinner(pair[1]);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GameCard(
                    game: pair[0],
                    winner: winner1,
                    onChange: onChange,
                    onWinnerSelected: onWinnerSelected,
                  ),
                  GameCard(
                    game: pair[1],
                    winner: winner2,
                    onChange: onChange,
                    onWinnerSelected: onWinnerSelected,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.28,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: _BracketCell(
                          team: winner1,
                          lineColor: tournament.borderColor,
                        ),
                      ),
                      Expanded(
                        child: _BracketCell(
                          team: winner2,
                          lineColor: tournament.borderColor,
                        ),
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FractionallySizedBox(
                        heightFactor: 0.5,
                        child: Container(
                          width: 1,
                          color: tournament.borderColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BracketCell extends StatelessWidget {
  const _BracketCell({required this.team, required this.lineColor});

  final Team team;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(height: 1, color: lineColor),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: TeamItem(team: team),
          ),
        ),
      ],
    );
  }
}