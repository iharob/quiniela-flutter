import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/user_session.dart';

part 'session_state.freezed.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState.initializing() = _Initializing;
  const factory SessionState.unauthenticated() = _Unauthenticated;
  const factory SessionState.authenticated(UserSession session) = _Authenticated;
}
