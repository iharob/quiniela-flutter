import 'package:flutter/material.dart';

import 'tournament_theme.dart';

ThemeData buildAppTheme(TournamentTheme tournament) {
  final colorScheme = ColorScheme.light(
    primary: tournament.primaryColor,
    onPrimary: tournament.contrastTextColor,
    secondary: tournament.primaryColorBright,
    onSecondary: tournament.contrastTextColor,
    surface: tournament.dimmedCardColor,
    onSurface: tournament.textColor,
    error: const Color(0xFFC00000),
    onError: Colors.white,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: tournament.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: tournament.cardColor,
      foregroundColor: tournament.contrastTextColor,
      iconTheme: IconThemeData(color: tournament.contrastTextColor),
      titleTextStyle: TextStyle(
        color: tournament.contrastTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: tournament.textColor),
      bodyLarge: TextStyle(color: tournament.textColor),
      titleMedium: TextStyle(color: tournament.textColor),
      titleLarge: TextStyle(color: tournament.textColor),
    ),
    extensions: <ThemeExtension<dynamic>>[tournament],
  );
}
