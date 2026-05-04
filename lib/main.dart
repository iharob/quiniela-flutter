import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/di/injection.dart';
import 'core/utils/simulate.dart';

bool get _firebaseSupported {
  if (kIsWeb) return false;
  return Platform.isAndroid || Platform.isIOS || Platform.isMacOS;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (_firebaseSupported) {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      debugPrint('Firebase init failed: $e');
    }
  }
  await Simulator.load();
  await configureDependencies();
  runApp(const QuinielaApp());
}
