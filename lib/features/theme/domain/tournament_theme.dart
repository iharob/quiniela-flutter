import 'package:flutter/material.dart';

/// Tournament-specific design tokens, exposed via [ThemeExtension] so they
/// flow through the standard `Theme.of(context).extension<T>()` channel.
@immutable
class TournamentTheme extends ThemeExtension<TournamentTheme> {
  const TournamentTheme({
    required this.textColor,
    required this.contrastTextColor,
    required this.placeholderTextColor,
    required this.backgroundColor,
    required this.cardColor,
    required this.dimmedCardColor,
    required this.primaryColor,
    required this.primaryColorBright,
    required this.borderColor,
  });

  final Color textColor;
  final Color contrastTextColor;
  final Color placeholderTextColor;
  final Color backgroundColor;
  final Color cardColor;
  final Color dimmedCardColor;
  final Color primaryColor;
  final Color primaryColorBright;
  final Color borderColor;

  @override
  TournamentTheme copyWith({
    Color? textColor,
    Color? contrastTextColor,
    Color? placeholderTextColor,
    Color? backgroundColor,
    Color? cardColor,
    Color? dimmedCardColor,
    Color? primaryColor,
    Color? primaryColorBright,
    Color? borderColor,
  }) {
    return TournamentTheme(
      textColor: textColor ?? this.textColor,
      contrastTextColor: contrastTextColor ?? this.contrastTextColor,
      placeholderTextColor: placeholderTextColor ?? this.placeholderTextColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      cardColor: cardColor ?? this.cardColor,
      dimmedCardColor: dimmedCardColor ?? this.dimmedCardColor,
      primaryColor: primaryColor ?? this.primaryColor,
      primaryColorBright: primaryColorBright ?? this.primaryColorBright,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  TournamentTheme lerp(ThemeExtension<TournamentTheme>? other, double t) {
    if (other is! TournamentTheme) return this;
    return TournamentTheme(
      textColor: Color.lerp(textColor, other.textColor, t)!,
      contrastTextColor:
          Color.lerp(contrastTextColor, other.contrastTextColor, t)!,
      placeholderTextColor:
          Color.lerp(placeholderTextColor, other.placeholderTextColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      dimmedCardColor: Color.lerp(dimmedCardColor, other.dimmedCardColor, t)!,
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      primaryColorBright:
          Color.lerp(primaryColorBright, other.primaryColorBright, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
    );
  }
}

const TournamentTheme defaultTournamentTheme = TournamentTheme(
  textColor: Color(0xFF2B2B2B),
  contrastTextColor: Color(0xFFF5F5F5),
  placeholderTextColor: Color(0x59000000),
  backgroundColor: Color(0xFFF5F5F5),
  cardColor: Color(0xFF121212),
  dimmedCardColor: Color(0xFFFFFFFF),
  primaryColor: Color(0xFF121212),
  primaryColorBright: Color(0xFF222222),
  borderColor: Color(0x80000000),
);

extension TournamentThemeContext on BuildContext {
  TournamentTheme get tournamentTheme =>
      Theme.of(this).extension<TournamentTheme>() ?? defaultTournamentTheme;
}
