import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quiniela_flutter/core/domain/user_session.dart';

@lazySingleton
class SessionStorage {
  SessionStorage(this._prefs);

  static const String _bearerKey = 'bearerToken';
  static const String _sessionKey = '@authToken';

  final SharedPreferences _prefs;

  Future<void> saveSession(UserSession session) async {
    await _prefs.setString(_bearerKey, session.token);
    await _prefs.setString(_sessionKey, jsonEncode(session.toJson()));
  }

  String? readBearerToken() => _prefs.getString(_bearerKey);

  UserSession? readSession() {
    final raw = _prefs.getString(_sessionKey);
    if (raw == null) return null;
    try {
      return UserSession.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<void> clear() async {
    await _prefs.remove(_bearerKey);
    await _prefs.remove(_sessionKey);
  }
}
