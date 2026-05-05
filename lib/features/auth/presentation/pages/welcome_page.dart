import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quiniela_flutter/core/config/app_config.dart';
import 'package:quiniela_flutter/shared/widgets/google_g_logo.dart';
import 'package:quiniela_flutter/shared/widgets/spinner_overlay.dart';
import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';
import 'package:quiniela_flutter/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:quiniela_flutter/features/auth/presentation/bloc/auth_state.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
    required this.onNavigateToRegister,
    required this.onNavigateToLogin,
  });

  final VoidCallback onNavigateToRegister;
  final VoidCallback onNavigateToLogin;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final isSubmitting =
            state.maybeWhen(submitting: () => true, orElse: () => false);
        final errorMessage = state.maybeWhen(
          failure: (kind, message) =>
              message ?? _messageForFailure(kind),
          orElse: () => null,
        );
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              width: AppConfig.logoWidth,
                              height: AppConfig.logoHeight,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'QUINIELA MUNDIAL 2026',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _GoogleSignInButton(
                    disabled: isSubmitting,
                    onPressed: () =>
                        context.read<AuthCubit>().signInWithGoogle(),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(child: _DividerLine(color: tournament.borderColor)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'o',
                          style: TextStyle(
                            color: tournament.textColor,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Expanded(child: _DividerLine(color: tournament.borderColor)),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  TextButton(
                    onPressed: onNavigateToRegister,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      'Registrarse con email',
                      style: TextStyle(
                        color: tournament.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: onNavigateToLogin,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      'Ya tengo cuenta',
                      style: TextStyle(
                        color: tournament.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  if (errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        errorMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Color(0xFFCC0000)),
                      ),
                    ),
                ],
              ),
            ),
            SpinnerOverlay(visible: isSubmitting),
          ],
        );
      },
    );
  }

  String _messageForFailure(AuthFailureKind kind) {
    switch (kind) {
      case AuthFailureKind.googleSignInFailed:
        return 'No pudimos iniciar sesión con Google';
      case AuthFailureKind.invalidCredentials:
        return 'Correo o contraseña incorrectos';
      case AuthFailureKind.googleAccountUsesPassword:
        return 'Esta cuenta usa Google Sign-In. Usá el botón de Google.';
      case AuthFailureKind.emailAlreadyUsed:
        return 'Ya existe una cuenta con ese correo.';
      case AuthFailureKind.unknown:
        return 'No pudimos iniciar sesión. Intentá de nuevo.';
    }
  }
}

class _DividerLine extends StatelessWidget {
  const _DividerLine({required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) =>
      Container(height: 1, color: color);
}

class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton({required this.onPressed, required this.disabled});

  final VoidCallback onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: disabled ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF1F1F1F),
          side: const BorderSide(color: Color(0xFF747775)),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GoogleGLogo(),
            SizedBox(width: 12),
            Text(
              'Iniciar sesión con Google',
              style: TextStyle(
                color: Color(0xFF1F1F1F),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
