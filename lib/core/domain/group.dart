import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:quiniela_flutter/core/domain/game.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Group with _$Group {
  const factory Group({
    required String name,
    required List<Game> games,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

@freezed
class GroupWithResults with _$GroupWithResults {
  const factory GroupWithResults({
    required String name,
    required List<GameWithResult> games,
  }) = _GroupWithResults;

  factory GroupWithResults.fromJson(Map<String, dynamic> json) =>
      _$GroupWithResultsFromJson(json);
}
