import 'package:flutter/material.dart';

import '../../features/theme/domain/tournament_theme.dart';

class SpinnerOverlay extends StatelessWidget {
  const SpinnerOverlay({super.key, required this.visible, this.size});

  final bool visible;
  final double? size;

  @override
  Widget build(BuildContext context) {
    if (!visible) return const SizedBox.shrink();
    final tournament = context.tournamentTheme;
    final dimension = size ?? 36;
    return Positioned.fill(
      child: ColoredBox(
        color: const Color(0x33000000),
        child: Center(
          child: SizedBox(
            width: dimension,
            height: dimension,
            child: CircularProgressIndicator(
              color: tournament.contrastTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
