import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_config.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

bool get _googleSignInSupported {
  if (kIsWeb) return true;
  return Platform.isAndroid || Platform.isIOS || Platform.isMacOS;
}

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
  if (_googleSignInSupported) {
    getIt.registerSingleton<GoogleSignIn>(
      GoogleSignIn(
        serverClientId: AppConfig.googleWebClientId,
        scopes: const ['email'],
      ),
    );
  } else {
    // Desktop platforms (Linux/Windows) don't have a native Google Sign-In
    // plugin; register a stub instance so DI still resolves.
    getIt.registerSingleton<GoogleSignIn>(GoogleSignIn(scopes: const ['email']));
  }
  getIt.init();
}
