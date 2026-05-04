import 'package:freezed_annotation/freezed_annotation.dart';

import 'team.dart';

part 'predicted_result.freezed.dart';
part 'predicted_result.g.dart';

/// Wire shape of a single row of GET /prediction/{userId}/score (see backend
/// `api/userScore.go`). Several fields are *omitempty* on the Go side, so the
/// JSON omits them entirely when null — we model those as nullable here.
@freezed
class PredictedResult with _$PredictedResult {
  const factory PredictedResult({
    required String gameDate,
    required Team predictedTeam1,
    required Team predictedTeam2,
    required int predictedScoreTeam1,
    required int predictedScoreTeam2,
    String? predictedWinner,
    Team? actualTeam1,
    Team? actualTeam2,
    int? actualScoreTeam1,
    int? actualScoreTeam2,
    String? actualWinner,
    required int matchPoints,
    required int total,
    required int round,
    String? classificationGroup,
    required bool played,
  }) = _PredictedResult;

  factory PredictedResult.fromJson(Map<String, dynamic> json) =>
      _$PredictedResultFromJson(json);
}

@freezed
class PointsDetails with _$PointsDetails {
  const factory PointsDetails({
    @Default(<PredictedResult>[]) List<PredictedResult> groups,
    @Default(<PredictedResult>[]) List<PredictedResult> knockout,
    PredictedResult? finalMatch,
  }) = _PointsDetails;

  factory PointsDetails.empty() => const PointsDetails();

  factory PointsDetails.fromJson(Map<String, dynamic> json) {
    return PointsDetails(
      groups: (json['groups'] as List<dynamic>? ?? const [])
          .map((e) => PredictedResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      knockout: (json['knockout'] as List<dynamic>? ?? const [])
          .map((e) => PredictedResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      finalMatch: json['final'] == null
          ? null
          : PredictedResult.fromJson(json['final'] as Map<String, dynamic>),
    );
  }
}
