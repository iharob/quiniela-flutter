import 'package:flutter/material.dart';

import '../../../../core/domain/rankings.dart';
import '../../../../shared/widgets/avatar.dart';
import '../../../theme/domain/tournament_theme.dart';
import 'score_cell.dart';

class RankingListItem extends StatelessWidget {
  const RankingListItem({super.key, required this.entry, this.onTap});

  final RankingsEntry entry;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              child: Text(
                entry.currentRank == 0 ? '' : '${entry.currentRank}',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 16,
              child: entry.rankDifference > 0
                  ? const Icon(Icons.arrow_upward,
                      color: Color(0xFF00A000), size: 14)
                  : entry.rankDifference < 0
                      ? const Icon(Icons.arrow_downward,
                          color: Color(0xFFC00000), size: 14)
                      : const SizedBox.shrink(),
            ),
            const SizedBox(width: 8),
            Avatar(name: entry.userName, uri: entry.photoUrl),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.userName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: tournament.textColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    entry.bio ?? '—',
                    style: TextStyle(
                      fontSize: 12,
                      color: tournament.placeholderTextColor,
                    ),
                  ),
                ],
              ),
            ),
            ScoreCell(
              score: entry.totalScore,
              difference: entry.totalScoreDifference,
            ),
          ],
        ),
      ),
    );
  }
}
