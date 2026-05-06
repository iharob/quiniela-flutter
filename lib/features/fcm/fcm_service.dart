import 'dart:async';
import 'dart:io' show Platform;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:quiniela_flutter/core/domain/user_results.dart';
import 'package:quiniela_flutter/core/observability/error_reporter.dart';
import 'package:quiniela_flutter/features/live/presentation/bloc/live_cubit.dart';

const _scoresTopic = 'scores';

@lazySingleton
class FcmService {
  FcmService(this._liveCubit);

  final LiveCubit _liveCubit;
  StreamSubscription<RemoteMessage>? _foregroundSub;
  bool _bootstrapped = false;

  bool get _isSupported {
    if (kIsWeb) return false;
    return Platform.isAndroid || Platform.isIOS || Platform.isMacOS;
  }

  Future<void> bootstrap() async {
    if (_bootstrapped) return;
    _bootstrapped = true;
    if (!_isSupported) {
      debugPrint('FCM unsupported on this platform; skipping bootstrap.');
      return;
    }
    try {
      final auth = await FirebaseMessaging.instance.requestPermission();
      final granted =
          auth.authorizationStatus == AuthorizationStatus.authorized ||
              auth.authorizationStatus == AuthorizationStatus.provisional;
      if (granted) {
        await FirebaseMessaging.instance.subscribeToTopic(_scoresTopic);
      }
      _foregroundSub =
          FirebaseMessaging.onMessage.listen(_handleScoreMessage);
    } catch (e, stack) {
      await ErrorReporter.capture(e, stack, hint: 'fcm_bootstrap');
    }
  }

  void _handleScoreMessage(RemoteMessage message) {
    final data = message.data;
    final team1 = data['team1'];
    final team2 = data['team2'];
    final t1Raw = data['team1Score'];
    final t2Raw = data['team2Score'];
    if (team1 is! String ||
        team2 is! String ||
        t1Raw is! String ||
        t2Raw is! String) {
      return;
    }
    final s1 = int.tryParse(t1Raw);
    final s2 = int.tryParse(t2Raw);
    if (s1 == null || s2 == null) return;
    final status = data['status'];
    _liveCubit.applyLiveScore(
      team1Country: team1,
      team2Country: team2,
      liveScore: LiveScore(
        team1Score: s1,
        team2Score: s2,
        status: status is String ? status : '',
      ),
    );
  }

  Future<void> dispose() async {
    await _foregroundSub?.cancel();
  }
}
