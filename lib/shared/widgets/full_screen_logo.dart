import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:quiniela_flutter/core/config/app_config.dart';

class FullScreenLogo extends StatelessWidget {
  const FullScreenLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/images/logo-white.svg',
        width: AppConfig.logoWidth,
        height: AppConfig.logoHeight,
        fit: BoxFit.contain,
      ),
    );
  }
}
