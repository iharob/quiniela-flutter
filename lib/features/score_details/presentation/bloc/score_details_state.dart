import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/predicted_result.dart';

part 'score_details_state.freezed.dart';

@freezed
class ScoreDetailsState with _$ScoreDetailsState {
  const factory ScoreDetailsState({
    @Default(false) bool fetching,
    PointsDetails? data,
    String? error,
  }) = _ScoreDetailsState;
}
