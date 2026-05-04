import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_session.freezed.dart';
part 'user_session.g.dart';

/// In-app representation of an authenticated session. The wire shape from the
/// auth endpoints does NOT match this directly — the backend's auth responses
/// carry only `{token, predicted, payed}` and the user id has to be extracted
/// from the JWT. Keep [UserSession.fromJson] / [toJson] for the on-device
/// persistence path only.
@freezed
class UserSession with _$UserSession {
  const factory UserSession({
    required int userId,
    required String token,
    required bool predicted,
    required bool payed,
  }) = _UserSession;

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);
}

/// Wire shape of POST /auth/{google,login,register}. The user id is *not*
/// present here; it lives in the JWT.
@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required String token,
    required bool predicted,
    required bool payed,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

/// Wire shape of GET /auth/session. The backend currently encodes `userId` as
/// a string; tolerate both shapes when parsing.
@freezed
class SessionInfo with _$SessionInfo {
  const factory SessionInfo({
    required int userId,
    required bool predicted,
    required bool payed,
  }) = _SessionInfo;

  factory SessionInfo.fromJson(Map<String, dynamic> json) {
    final raw = json['userId'] ?? json['userID'];
    final id = switch (raw) {
      int v => v,
      num v => v.toInt(),
      String v => int.tryParse(v) ?? (throw FormatException('userId not int: $v')),
      _ => throw FormatException('userId missing or unsupported type: $raw'),
    };
    return SessionInfo(
      userId: id,
      predicted: json['predicted'] as bool,
      payed: json['payed'] as bool,
    );
  }
}

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @JsonKey(name: 'userID') required int userId,
    required String name,
    required String email,
    String? bio,
    String? photoUrl,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
class PublicUserProfile with _$PublicUserProfile {
  const factory PublicUserProfile({
    @JsonKey(name: 'userID') required int userId,
    required String name,
    String? bio,
    String? photoUrl,
  }) = _PublicUserProfile;

  factory PublicUserProfile.fromJson(Map<String, dynamic> json) =>
      _$PublicUserProfileFromJson(json);
}
