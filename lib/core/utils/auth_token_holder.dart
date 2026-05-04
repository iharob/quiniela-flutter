import 'package:injectable/injectable.dart';

/// Holds the current bearer token so the [Dio] interceptor can pick it up
/// without depending on the session bloc directly.
@lazySingleton
class AuthTokenHolder {
  String? _token;

  String? get token => _token;

  void setToken(String? token) => _token = token;
}
