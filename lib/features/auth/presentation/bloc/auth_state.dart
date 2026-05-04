import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

enum AuthFailureKind {
  invalidCredentials,
  emailAlreadyUsed,
  googleAccountUsesPassword,
  googleSignInFailed,
  unknown,
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState.idle() = _Idle;
  const factory AuthState.submitting() = _Submitting;
  const factory AuthState.success() = _Success;
  const factory AuthState.failure(AuthFailureKind kind, [String? message]) =
      _Failure;
}
