import 'dart:convert';

/// Decodes a JWT's payload (the middle, unsigned segment). Does NOT verify the
/// signature — that's the server's job. We only use this to read claims the
/// server has already promised, e.g. the user id.
Map<String, dynamic> decodeJwtPayload(String token) {
  final parts = token.split('.');
  if (parts.length < 2) {
    throw const FormatException('JWT must have at least two segments');
  }
  final payload = parts[1];
  // base64url, but JWTs omit padding — restore it before decoding.
  final padded = payload + '=' * ((4 - payload.length % 4) % 4);
  final json = utf8.decode(base64Url.decode(padded));
  final decoded = jsonDecode(json);
  if (decoded is! Map<String, dynamic>) {
    throw const FormatException('JWT payload is not a JSON object');
  }
  return decoded;
}

/// Pulls the `user` claim out of a Quiniela API JWT. Backend embeds the user
/// id there (see [api/googleAuth.go]); reading it client-side avoids a second
/// round-trip just to learn the user id.
int userIdFromJwt(String token) {
  final claims = decodeJwtPayload(token);
  final raw = claims['user'];
  if (raw is int) return raw;
  if (raw is num) return raw.toInt();
  if (raw is String) {
    final parsed = int.tryParse(raw);
    if (parsed != null) return parsed;
  }
  throw FormatException('JWT "user" claim missing or not numeric: $raw');
}
