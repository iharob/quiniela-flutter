import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quiniela_flutter/shared/widgets/spinner_overlay.dart';
import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';
import 'package:quiniela_flutter/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:quiniela_flutter/features/auth/presentation/bloc/auth_state.dart';

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  String? _validationError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _submit() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      setState(() => _validationError = 'Ingrese su correo y contraseña');
      return;
    }
    if (!email.contains('@') || !email.contains('.')) {
      setState(() => _validationError = 'El correo electrónico no es válido');
      return;
    }
    setState(() => _validationError = null);
    context.read<AuthCubit>().emailLogin(email: email, password: password);
  }

  String? _failureMessage(AuthState state) {
    return state.maybeWhen(
      failure: (kind, _) {
        switch (kind) {
          case AuthFailureKind.invalidCredentials:
            return 'Correo o contraseña incorrectos';
          case AuthFailureKind.googleAccountUsesPassword:
            return 'Esta cuenta usa Google Sign-In. Usá el botón de Google.';
          case AuthFailureKind.emailAlreadyUsed:
          case AuthFailureKind.googleSignInFailed:
          case AuthFailureKind.unknown:
            return 'No pudimos iniciar sesión. Intentá de nuevo.';
        }
      },
      orElse: () => null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final submitting =
            state.maybeWhen(submitting: () => true, orElse: () => false);
        final remoteError = _failureMessage(state);
        final error = _validationError ?? remoteError;
        return Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(30, 12, 30, 30),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: widget.onBack,
                        style: TextButton.styleFrom(
                          foregroundColor: tournament.primaryColor,
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 16,
                            top: 8,
                            bottom: 8,
                          ),
                        ),
                        icon: const Icon(Icons.arrow_back, size: 24),
                        label: const Text(
                          'Volver',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: tournament.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _AuthTextField(
                      controller: _emailController,
                      hint: 'Correo electrónico',
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      autofillHints: const [AutofillHints.email],
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) => _passwordFocus.requestFocus(),
                    ),
                    const SizedBox(height: 12),
                    _AuthTextField(
                      controller: _passwordController,
                      focusNode: _passwordFocus,
                      hint: 'Contraseña',
                      obscureText: true,
                      autofillHints: const [AutofillHints.password],
                      textInputAction: TextInputAction.go,
                      onSubmitted: (_) => _submit(),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 50,
                      child: FilledButton(
                        onPressed: submitting ? null : _submit,
                        style: FilledButton.styleFrom(
                          backgroundColor: tournament.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'ENTRAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    if (error != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          error,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Color(0xFFCC0000)),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SpinnerOverlay(visible: submitting),
          ],
        );
      },
    );
  }
}

class _AuthTextField extends StatelessWidget {
  const _AuthTextField({
    required this.controller,
    required this.hint,
    this.focusNode,
    this.keyboardType,
    this.obscureText = false,
    this.autocorrect = true,
    this.autofillHints,
    this.textInputAction,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool autocorrect;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autocorrect: autocorrect,
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      onSubmitted: onSubmitted,
      style: TextStyle(color: tournament.textColor, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: tournament.placeholderTextColor),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: tournament.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: tournament.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: tournament.primaryColor, width: 1.5),
        ),
      ),
    );
  }
}
