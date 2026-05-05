import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:quiniela_flutter/core/domain/user_session.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool loading,
    @Default(false) bool saving,
    UserProfile? profile,
    String? error,
    @Default(false) bool saved,
  }) = _ProfileState;
}
