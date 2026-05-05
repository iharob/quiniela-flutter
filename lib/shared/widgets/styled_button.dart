import 'package:flutter/material.dart';

import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    required this.label,
    this.onPressed,
    this.disabled = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    final background = disabled
        ? tournament.primaryColorBright.withValues(alpha: 0.25)
        : tournament.primaryColorBright;
    return TextButton(
      onPressed: disabled ? null : onPressed,
      style: TextButton.styleFrom(
        backgroundColor: background,
        foregroundColor: tournament.contrastTextColor,
        disabledBackgroundColor: background,
        disabledForegroundColor: tournament.contrastTextColor,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({super.key, this.disabled = false, this.onNext});

  final bool disabled;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return StyledButton(
      label: 'Aceptar',
      disabled: disabled,
      onPressed: onNext,
    );
  }
}
