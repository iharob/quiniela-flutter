import 'package:flutter/material.dart';

import 'package:quiniela_flutter/core/domain/game.dart';
import 'package:quiniela_flutter/core/domain/team.dart';
import 'package:quiniela_flutter/core/utils/winner.dart';
import 'package:quiniela_flutter/shared/widgets/team_item.dart';
import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';
import 'package:quiniela_flutter/features/predict/presentation/widgets/game_card.dart';

class GameGroupView extends StatelessWidget {
  const GameGroupView({
    super.key,
    required this.pair,
    required this.onChange,
    required this.onWinnerSelected,
    this.gameFlex = 6,
    this.bracketFlex = 5,
  });

  final List<GameWithResult> pair;
  final void Function(int gameId, Team team, int? value) onChange;
  final ValueChanged<Team> onWinnerSelected;

  /// Relative width of the team-rows column (left side).
  final int gameFlex;

  /// Relative width of the bracket+winner column (right side).
  final int bracketFlex;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _GameBracket(
            game: pair[0],
            onChange: onChange,
            onWinnerSelected: onWinnerSelected,
            gameFlex: gameFlex,
            bracketFlex: bracketFlex,
            lineColor: tournament.textColor,
          ),
          _GameBracket(
            game: pair[1],
            onChange: onChange,
            onWinnerSelected: onWinnerSelected,
            gameFlex: gameFlex,
            bracketFlex: bracketFlex,
            lineColor: tournament.textColor,
          ),
        ],
      ),
    );
  }
}

class _GameBracket extends StatelessWidget {
  const _GameBracket({
    required this.game,
    required this.onChange,
    required this.onWinnerSelected,
    required this.gameFlex,
    required this.bracketFlex,
    required this.lineColor,
  });

  final GameWithResult game;
  final void Function(int gameId, Team team, int? value) onChange;
  final ValueChanged<Team> onWinnerSelected;
  final int gameFlex;
  final int bracketFlex;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    final winner = getWinner(game);
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: gameFlex,
              child: GameCard(
                padding: const EdgeInsets.fromLTRB(10, 7, 0, 7),
                game: game,
                winner: winner.country == 'NA' ? null : winner,
                onWinnerSelected: onWinnerSelected,
                onChange: onChange,
              ),
            ),
            Expanded(
              flex: bracketFlex,
              child: _BracketConnector(winner: winner, lineColor: lineColor),
            ),
          ],
        ),
      ),
    );
  }
}

class _BracketConnector extends StatelessWidget {
  const _BracketConnector({required this.winner, required this.lineColor});

  final Team winner;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    final borderSide = BorderSide(width: 1.5, color: tournament.borderColor);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 2.0,
      children: [
        SizedBox(
          width: 30.0,
          child: Container(
            height: 12,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(6.0),
              ),
              border: Border(top: borderSide, right: borderSide),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0),
          child: TeamItem(team: winner),
        ),
        SizedBox(
          width: 30.0,
          child: Container(
            height: 12,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(6.0),
              ),
              border: Border(bottom: borderSide, right: borderSide),
            ),
          ),
        ),
      ],
    );
  }
}
