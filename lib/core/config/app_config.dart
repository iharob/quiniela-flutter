import 'package:flutter/foundation.dart';

class AppConfig {
  const AppConfig._();

  static const String _remoteBootstrap = 'https://iaales.lat';
  // Use 127.0.0.1 so the app reaches the dev server forwarded via
  // `adb reverse tcp:8000 tcp:8000`. The 10.0.2.2 alias only exists on the
  // Android emulator; physical devices need 127.0.0.1.
  static const String _localBootstrap = 'http://127.0.0.1:8000';

  static String get _bootstrapUrl => kReleaseMode ? _remoteBootstrap : _localBootstrap;
  static bool get simulate => !kReleaseMode;

  static String get apiUrl => '$_bootstrapUrl/api/v1';

  /// Web OAuth 2.0 client ID for the GCP project. Must be a Web client (not Android).
  static const String googleWebClientId =
      '859548115306-342jbj9ufv08iomd3ojecnfn6srbj0sv.apps.googleusercontent.com';

  static const double logoWidth = 217;
  static const double logoHeight = 217;
  static const double buttonHeight = 50;
}
