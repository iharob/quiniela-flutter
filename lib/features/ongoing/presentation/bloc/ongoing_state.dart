import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/user_results.dart';

part 'ongoing_state.freezed.dart';

@freezed
class OngoingState with _$OngoingState {
  const factory OngoingState({
    @Default(false) bool fetching,
    @Default(<GameResultGroup>[]) List<GameResultGroup> groups,
    String? error,
  }) = _OngoingState;
}
