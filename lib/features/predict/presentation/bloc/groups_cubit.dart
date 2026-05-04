import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/api_client.dart';
import '../../../../core/domain/classification.dart';
import '../../../../core/domain/game.dart';
import '../../../../core/domain/group.dart';
import '../../../../core/domain/team.dart';
import '../../data/groups_storage.dart';
import 'groups_state.dart';

class GroupsCubit extends Cubit<GroupsState> {
  GroupsCubit({
    required ApiClient apiClient,
    required GroupsStorage storage,
    required this.userId,
  })  : _apiClient = apiClient,
        _storage = storage,
        super(GroupsState.initial());

  final ApiClient _apiClient;
  final GroupsStorage _storage;
  final int userId;

  int get completed {
    var count = 0;
    for (final group in state.groups) {
      for (final game in group.games) {
        if (game.team1Score != null && game.team2Score != null) count += 1;
      }
    }
    return count;
  }

  int get total =>
      state.groups.fold<int>(0, (acc, g) => acc + g.games.length);

  Future<void> load() async {
    emit(state.copyWith(loading: true, error: null));
    final persisted = await _storage.load(userId);
    try {
      final fresh = await _apiClient.fetchGroups();
      final merged = _mergePersistedScores(fresh, persisted);
      await _storage.removeStale(userId, fresh.map((g) => g.name).toSet());
      emit(state.copyWith(
        loading: false,
        groups: merged,
        positions: computeClassificationTable(merged),
      ));
    } catch (e) {
      emit(state.copyWith(
        loading: false,
        groups: persisted,
        positions: computeClassificationTable(persisted),
        error: e.toString(),
      ));
    }
  }

  void updateGameScore({
    required int gameId,
    required Team team,
    required int? value,
  }) {
    String? updatedGroup;
    final groups = state.groups.map((group) {
      var changed = false;
      final games = group.games.map((game) {
        if (game.gameId != gameId) return game;
        changed = true;
        return team.country == game.team1.country
            ? game.copyWith(team1Score: value)
            : game.copyWith(team2Score: value);
      }).toList();
      if (!changed) return group;
      updatedGroup = group.name;
      return group.copyWith(games: games);
    }).toList();

    emit(state.copyWith(
      groups: groups,
      positions: computeClassificationTable(groups),
    ));

    if (updatedGroup != null) {
      final group = groups.firstWhere((g) => g.name == updatedGroup);
      _storage.save(userId, group);
    }
  }

  List<GroupWithResults> _mergePersistedScores(
    List<GroupWithResults> fresh,
    List<GroupWithResults> persisted,
  ) {
    if (persisted.isEmpty) return fresh;
    final byName = {for (final g in persisted) g.name: g};
    return fresh.map((group) {
      final saved = byName[group.name];
      if (saved == null) return group;
      if (saved.games.length != group.games.length) return group;
      final byId = {for (final g in saved.games) g.gameId: g};
      final merged = <GameWithResult>[];
      for (final game in group.games) {
        final s = byId[game.gameId];
        if (s == null) return group;
        merged.add(game.copyWith(
          team1Score: s.team1Score,
          team2Score: s.team2Score,
        ));
      }
      return group.copyWith(games: merged);
    }).toList();
  }
}
