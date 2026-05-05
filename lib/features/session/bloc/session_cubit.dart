import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:quiniela_flutter/core/data/api_client.dart';
import 'package:quiniela_flutter/core/domain/user_session.dart';
import 'package:quiniela_flutter/core/utils/auth_token_holder.dart';
import 'package:quiniela_flutter/features/session/data/session_storage.dart';
import 'package:quiniela_flutter/features/session/bloc/session_state.dart';

@lazySingleton
class SessionCubit extends Cubit<SessionState> {
  SessionCubit(this._storage, this._tokenHolder, this._apiClient)
      : super(const SessionState.initializing());

  final SessionStorage _storage;
  final AuthTokenHolder _tokenHolder;
  final ApiClient _apiClient;

  UserSession? get currentSession => state.maybeWhen(
        authenticated: (s) => s,
        orElse: () => null,
      );

  Future<void> bootstrap() async {
    final savedToken = _storage.readBearerToken();
    if (savedToken == null || savedToken.isEmpty) {
      emit(const SessionState.unauthenticated());
      return;
    }
    _tokenHolder.setToken(savedToken);
    try {
      final info = await _apiClient.loadSession();
      if (info == null) {
        await _storage.clear();
        _tokenHolder.setToken(null);
        emit(const SessionState.unauthenticated());
        return;
      }
      final session = UserSession(
        userId: info.userId,
        token: savedToken,
        predicted: info.predicted,
        payed: info.payed,
      );
      await _storage.saveSession(session);
      emit(SessionState.authenticated(session));
    } catch (_) {
      emit(const SessionState.unauthenticated());
    }
  }

  Future<void> setSession(UserSession session) async {
    _tokenHolder.setToken(session.token);
    await _storage.saveSession(session);
    emit(SessionState.authenticated(session));
  }

  Future<void> markPredicted() async {
    final current = currentSession;
    if (current == null) return;
    await setSession(current.copyWith(predicted: true));
  }

  Future<void> markPayed() async {
    final current = currentSession;
    if (current == null) return;
    await setSession(current.copyWith(payed: true));
  }

  Future<void> logout() async {
    await _storage.clear();
    _tokenHolder.setToken(null);
    emit(const SessionState.unauthenticated());
  }
}
