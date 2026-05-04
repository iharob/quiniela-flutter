import 'package:freezed_annotation/freezed_annotation.dart';

part 'rankings.freezed.dart';
part 'rankings.g.dart';

/// Wire shape of GET /rankings — see backend `api/rankings.go`. The Go struct
/// only exposes the subset of fields below; older RN type definitions
/// claimed extra `gamesScore*` / `classifiersScore*` fields, but the API
/// never actually sent them.
@freezed
class RankingsEntry with _$RankingsEntry {
  const factory RankingsEntry({
    required String userName,
    @JsonKey(name: 'userID') required int userId,
    required int totalScore,
    required int totalScoreDifference,
    required int rankDifference,
    required int currentRank,
    String? bio,
    String? photoUrl,
  }) = _RankingsEntry;

  factory RankingsEntry.fromJson(Map<String, dynamic> json) =>
      _$RankingsEntryFromJson(json);
}
