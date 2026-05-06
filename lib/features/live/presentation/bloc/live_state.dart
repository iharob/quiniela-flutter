import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:quiniela_flutter/core/domain/user_results.dart';

part 'live_state.freezed.dart';

@freezed
class LiveState with _$LiveState {
  const factory LiveState({
    @Default(false) bool fetching,
    @Default(<GameResultGroup>[]) List<GameResultGroup> groups,
    String? error,
  }) = _LiveState;
}