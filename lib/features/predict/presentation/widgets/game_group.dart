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
      child: Row(
        children: [
          Expanded(
            child: Column(
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
            width: MediaQuery.of(context).size.width * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _Connector(color: tournament.borderColor),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: TeamItem(team: winner1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: TeamItem(team: winner2),
                ),
                _Connector(color: tournament.borderColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Connector extends StatelessWidget {
  const _Connector({required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, height: 1, color: color);
  }
}
