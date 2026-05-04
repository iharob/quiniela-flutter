import 'package:flutter/material.dart';

import '../../features/theme/domain/tournament_theme.dart';

class ListItemSeparator extends StatelessWidget {
  const ListItemSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return Container(
      height: 1,
      color: tournament.borderColor,
    );
  }
}

class ListEmptyMessage extends StatelessWidget {
  const ListEmptyMessage({
    super.key,
    required this.message,
    this.error = false,
  });

  final String message;
  final bool error;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: tournament.borderColor,
              ),
            ),
            if (error)
              Text(
                'Desliza hacia abajo para refrescar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: tournament.borderColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
