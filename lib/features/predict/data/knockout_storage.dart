import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/domain/game.dart';

typedef KnockoutRounds = Map<int, List<List<GameWithResult>>>;

@lazySingleton
class KnockoutStorage {
  KnockoutStorage(this._prefs);

  final SharedPreferences _prefs;

  String _key(int userId) => '@knockout_v2_${userId}_default';

  Future<KnockoutRounds> load(int userId) async {
    final raw = _prefs.getString(_key(userId));
    if (raw == null) return <int, List<List<GameWithResult>>>{};
    try {
      final json = jsonDecode(raw) as Map<String, dynamic>;
      return json.map((roundKey, value) {
        final pairs = (value as List<dynamic>).map((pair) {
          final list = pair as List<dynamic>;
          return list
              .map((g) => GameWithResult.fromJson(g as Map<String, dynamic>))
              .toList();
        }).toList();
        return MapEntry(int.parse(roundKey), pairs);
      });
    } catch (_) {
      return <int, List<List<GameWithResult>>>{};
    }
  }

  Future<void> save(int userId, KnockoutRounds rounds) async {
    final json = rounds.map((round, pairs) => MapEntry(
          round.toString(),
          pairs
              .map((p) => p.map((g) => g.toJson()).toList())
              .toList(),
        ));
    await _prefs.setString(_key(userId), jsonEncode(json));
  }

  Future<void> clear(int userId) async {
    await _prefs.remove(_key(userId));
  }
}
