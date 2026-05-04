import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/domain/group.dart';

@lazySingleton
class GroupsStorage {
  GroupsStorage(this._prefs);

  final SharedPreferences _prefs;

  static const String _legacyKey = '@groupsStore';
  static const String _legacyPrefix = '@groupsStore_';

  String _userPrefix(int userId) => '@groupsStore_${userId}_';
  String _keyFor(int userId, String groupName) =>
      '${_userPrefix(userId)}$groupName';

  Future<List<GroupWithResults>> load(int userId) async {
    await _migrate(userId);
    final prefix = _userPrefix(userId);
    final keys =
        _prefs.getKeys().where((k) => k.startsWith(prefix)).toList()..sort();
    final results = <GroupWithResults>[];
    for (final key in keys) {
      final raw = _prefs.getString(key);
      if (raw == null) continue;
      try {
        results.add(
          GroupWithResults.fromJson(jsonDecode(raw) as Map<String, dynamic>),
        );
      } catch (_) {
        // Skip malformed entries silently.
      }
    }
    return results;
  }

  Future<void> save(int userId, GroupWithResults group) async {
    await _prefs.setString(
      _keyFor(userId, group.name),
      jsonEncode(group.toJson()),
    );
  }

  Future<void> removeStale(int userId, Set<String> validNames) async {
    final prefix = _userPrefix(userId);
    final stale = _prefs
        .getKeys()
        .where((k) =>
            k.startsWith(prefix) && !validNames.contains(k.substring(prefix.length)))
        .toList();
    for (final key in stale) {
      await _prefs.remove(key);
    }
  }

  Future<void> _migrate(int userId) async {
    final legacy = _prefs.getString(_legacyKey);
    if (legacy != null) {
      try {
        final list = jsonDecode(legacy) as List<dynamic>;
        for (final entry in list) {
          final group =
              GroupWithResults.fromJson(entry as Map<String, dynamic>);
          await _prefs.setString(
            _keyFor(userId, group.name),
            jsonEncode(group.toJson()),
          );
        }
      } catch (_) {
        // Ignore malformed legacy data.
      }
      await _prefs.remove(_legacyKey);
    }
    final userPrefix = _userPrefix(userId);
    final pre = _prefs.getKeys().where(
          (k) => k.startsWith(_legacyPrefix) && !k.startsWith(userPrefix),
        );
    for (final key in pre) {
      final value = _prefs.getString(key);
      if (value == null) continue;
      final groupName = key.substring(_legacyPrefix.length);
      final newKey = _keyFor(userId, groupName);
      if (_prefs.getString(newKey) == null) {
        await _prefs.setString(newKey, value);
      }
      await _prefs.remove(key);
    }
  }
}
