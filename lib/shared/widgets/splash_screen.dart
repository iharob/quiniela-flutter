import 'package:flutter/material.dart';

import 'package:quiniela_flutter/shared/widgets/full_screen_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFB3000F),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF1F3A), Color(0xFFB3000F)],
          ),
        ),
        child: FullScreenLogo(),
      ),
    );
  }
}
