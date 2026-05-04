import 'package:freezed_annotation/freezed_annotation.dart';

import 'team.dart';

part 'user_results.freezed.dart';
part 'user_results.g.dart';

@freezed
class ApplicationUser with _$ApplicationUser {
  const factory ApplicationUser({
    required int id,
    required String name,
    String? photoUrl,
  }) = _ApplicationUser;

  factory ApplicationUser.fromJson(Map<String, dynamic> json) =>
      _$ApplicationUserFromJson(json);
}

@freezed
class UserResult with _$UserResult {
  const factory UserResult({
    required ApplicationUser user,
    required int team1Score,
    required int team2Score,
  }) = _UserResult;

  factory UserResult.fromJson(Map<String, dynamic> json) =>
      _$UserResultFromJson(json);
}

@freezed
class LiveScore with _$LiveScore {
  const factory LiveScore({
    required int team1Score,
    required int team2Score,
    @Default('') String status,
  }) = _LiveScore;

  factory LiveScore.fromJson(Map<String, dynamic> json) =>
      _$LiveScoreFromJson(json);
}

@freezed
class GameResultGroup with _$GameResultGroup {
  const factory GameResultGroup({
    required Team team1,
    required Team team2,
    required List<UserResult> groupResults,
    LiveScore? liveScore,
  }) = _GameResultGroup;

  factory GameResultGroup.fromJson(Map<String, dynamic> json) =>
      _$GameResultGroupFromJson(json);
}
