import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:quiniela_flutter/app/app.dart';
import 'package:quiniela_flutter/core/di/injection.dart';
import 'package:quiniela_flutter/core/observability/error_reporter.dart';
import 'package:quiniela_flutter/core/observability/sentry_bootstrap.dart';
import 'package:quiniela_flutter/core/utils/simulate.dart';

bool get _firebaseSupported {
  if (kIsWeb) return false;
  return Platform.isAndroid || Platform.isIOS || Platform.isMacOS;
}

Future<void> main() async {
  await initSentry(() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (_firebaseSupported) {
      try {
        await Firebase.initializeApp();
      } catch (e, stack) {
        await ErrorReporter.capture(e, stack, hint: 'firebase_init');
      }
    }
    await Simulator.load();
    await configureDependencies();
    runApp(const QuinielaApp());
  });
}
