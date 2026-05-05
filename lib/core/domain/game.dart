import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:quiniela_flutter/core/domain/team.dart';

part 'game.freezed.dart';
part 'game.g.dart';

@freezed
class Game with _$Game {
  const factory Game({
    required int gameId,
    required Team team1,
    required Team team2,
    String? date,
  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}

@freezed
class GameWithResult with _$GameWithResult {
  const factory GameWithResult({
    required int gameId,
    required Team team1,
    required Team team2,
    String? date,
    int? team1Score,
    int? team2Score,
    Team? winner,
  }) = _GameWithResult;

  factory GameWithResult.fromJson(Map<String, dynamic> json) =>
      _$GameWithResultFromJson(json);
}

@freezed
class BracketMatch with _$BracketMatch {
  const factory BracketMatch({
    required int gameId,
    Team? team1,
    Team? team2,
    int? team1Score,
    int? team2Score,
    Team? winner,
    String? date,
    int? team1FromGame,
    int? team2FromGame,
  }) = _BracketMatch;

  factory BracketMatch.fromJson(Map<String, dynamic> json) =>
      _$BracketMatchFromJson(json);
}

@freezed
class BracketRound with _$BracketRound {
  const factory BracketRound({
    required int round,
    required List<BracketMatch> matches,
  }) = _BracketRound;

  factory BracketRound.fromJson(Map<String, dynamic> json) =>
      _$BracketRoundFromJson(json);
}
