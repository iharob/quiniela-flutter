import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import 'package:quiniela_flutter/core/data/api_client.dart';
import 'package:quiniela_flutter/features/session/bloc/session_cubit.dart';
import 'package:quiniela_flutter/features/auth/presentation/bloc/auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._apiClient, this._sessionCubit, this._googleSignIn)
      : super(const AuthState.idle());

  final ApiClient _apiClient;
  final SessionCubit _sessionCubit;
  final GoogleSignIn _googleSignIn;

  Future<void> signInWithGoogle() async {
    emit(const AuthState.submitting());
    debugPrint('[GoogleSignIn] start');
    try {
      final account = await _googleSignIn.signIn();
      debugPrint('[GoogleSignIn] signIn() returned: ${account?.email ?? '<null>'}');
      if (account == null) {
        emit(const AuthState.idle());
        return;
      }
      final auth = await account.authentication;
      final idToken = auth.idToken;
      final accessToken = auth.accessToken;
      debugPrint(
        '[GoogleSignIn] tokens — idToken=${idToken != null} accessToken=${accessToken != null}',
      );
      if (idToken == null) {
        emit(const AuthState.failure(
          AuthFailureKind.googleSignInFailed,
          'No se pudo obtener el ID token (verifica el SHA-1 en Firebase y el serverClientId).',
        ));
        return;
      }
      final session = await _apiClient.googleAuth(idToken);
      await _sessionCubit.setSession(session);
      emit(const AuthState.success());
    } on PlatformException catch (e, stack) {
      debugPrint('[GoogleSignIn] PlatformException code=${e.code} message=${e.message}');
      debugPrintStack(stackTrace: stack);
      emit(AuthState.failure(
        AuthFailureKind.googleSignInFailed,
        'GoogleSignIn ${e.code}: ${e.message ?? '<no message>'}',
      ));
    } on DioException catch (e, stack) {
      debugPrint('[GoogleSignIn] backend ${e.response?.statusCode}: ${e.message}');
      debugPrintStack(stackTrace: stack);
      emit(AuthState.failure(
        AuthFailureKind.googleSignInFailed,
        'Backend ${e.response?.statusCode}: ${e.message ?? '<no message>'}',
      ));
    } catch (e, stack) {
      debugPrint('[GoogleSignIn] unexpected: $e');
      debugPrintStack(stackTrace: stack);
      emit(AuthState.failure(
        AuthFailureKind.googleSignInFailed,
        e.toString(),
      ));
    }
  }

  Future<void> emailLogin({
    required String email,
    required String password,
  }) async {
    emit(const AuthState.submitting());
    try {
      final session = await _apiClient.emailLogin(
        email: email,
        password: password,
      );
      await _sessionCubit.setSession(session);
      emit(const AuthState.success());
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      if (status == 401) {
        emit(const AuthState.failure(AuthFailureKind.invalidCredentials));
      } else if (status == 409) {
        emit(
          const AuthState.failure(AuthFailureKind.googleAccountUsesPassword),
        );
      } else {
        emit(const AuthState.failure(AuthFailureKind.unknown));
      }
    } catch (_) {
      emit(const AuthState.failure(AuthFailureKind.unknown));
    }
  }

  Future<void> emailRegister({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(const AuthState.submitting());
    try {
      final session = await _apiClient.emailRegister(
        email: email,
        name: name,
        password: password,
      );
      await _sessionCubit.setSession(session);
      emit(const AuthState.success());
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        emit(const AuthState.failure(AuthFailureKind.emailAlreadyUsed));
      } else {
        emit(const AuthState.failure(AuthFailureKind.unknown));
      }
    } catch (_) {
      emit(const AuthState.failure(AuthFailureKind.unknown));
    }
  }
}
