import 'package:flutter/material.dart';

import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';

class RankingsListHeader extends StatelessWidget {
  const RankingsListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return Container(
      color: tournament.cardColor,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            child: Icon(Icons.emoji_events,
                color: tournament.contrastTextColor, size: 16),
          ),
          const SizedBox(width: 24),
          const SizedBox(width: 36 + 10),
          Expanded(
            child: Text(
              'Nombre',
              style: TextStyle(
                color: tournament.contrastTextColor,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 50,
            child: Center(
              child: Icon(Icons.star_half,
                  color: tournament.contrastTextColor, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}
