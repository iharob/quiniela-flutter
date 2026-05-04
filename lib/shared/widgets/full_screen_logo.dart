import 'package:flutter/material.dart';

import '../../core/config/app_config.dart';

class FullScreenLogo extends StatelessWidget {
  const FullScreenLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/logo-white.png',
        width: AppConfig.logoWidth,
        height: AppConfig.logoHeight,
        fit: BoxFit.contain,
      ),
    );
  }
}
