import 'package:flutter/material.dart';

import 'package:quiniela_flutter/shared/widgets/score_difference_badge.dart';
import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';

class ScoreCell extends StatelessWidget {
  const ScoreCell({super.key, required this.score, required this.difference});

  final int? score;
  final int difference;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return SizedBox(
      width: 50,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: score == 0 ? 0.3 : 1,
            child: Text(
              '${score ?? ''}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: tournament.textColor,
              ),
            ),
          ),
          ScoreDifferenceBadge(difference: difference),
        ],
      ),
    );
  }
}
