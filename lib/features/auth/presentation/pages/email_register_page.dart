import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quiniela_flutter/shared/widgets/spinner_overlay.dart';
import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';
import 'package:quiniela_flutter/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:quiniela_flutter/features/auth/presentation/bloc/auth_state.dart';

class EmailRegisterPage extends StatefulWidget {
  const EmailRegisterPage({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  State<EmailRegisterPage> createState() => _EmailRegisterPageState();
}

class _EmailRegisterPageState extends State<EmailRegisterPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmFocus = FocusNode();

  String? _validationError;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmFocus.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _name.text.trim();
    final email = _email.text.trim();
    final password = _password.text;
    final confirm = _confirm.text;
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirm.isEmpty) {
      setState(() => _validationError = 'Todos los campos son obligatorios');
      return;
    }
    if (!email.contains('@') || !email.contains('.')) {
      setState(() => _validationError = 'El correo electrónico no es válido');
      return;
    }
    if (password.length < 8) {
      setState(() =>
          _validationError = 'La contraseña debe tener al menos 8 caracteres');
      return;
    }
    if (password != confirm) {
      setState(() => _validationError = 'Las contraseñas no coinciden');
      return;
    }
    setState(() => _validationError = null);
    context.read<AuthCubit>().emailRegister(
          name: name,
          email: email,
          password: password,
        );
  }

  String? _failureMessage(AuthState state) {
    return state.maybeWhen(
      failure: (kind, _) => kind == AuthFailureKind.emailAlreadyUsed
          ? 'Ya existe una cuenta con ese correo. Si te registraste con Google, usa el botón de Google.'
          : 'No pudimos completar el registro. Intenta de nuevo.',
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
        final error = _validationError ?? _failureMessage(state);
        return Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: widget.onBack,
                      style: TextButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        '← Volver',
                        style: TextStyle(
                          color: tournament.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Crear cuenta',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: tournament.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _Field(
                      controller: _name,
                      hint: 'Nombre',
                      autofillHints: const [AutofillHints.name],
                      onSubmitted: (_) => _emailFocus.requestFocus(),
                    ),
                    const SizedBox(height: 12),
                    _Field(
                      controller: _email,
                      focusNode: _emailFocus,
                      hint: 'Correo electrónico',
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      onSubmitted: (_) => _passwordFocus.requestFocus(),
                    ),
                    const SizedBox(height: 12),
                    _Field(
                      controller: _password,
                      focusNode: _passwordFocus,
                      hint: 'Contraseña',
                      obscureText: true,
                      autofillHints: const [AutofillHints.newPassword],
                      onSubmitted: (_) => _confirmFocus.requestFocus(),
                    ),
                    const SizedBox(height: 12),
                    _Field(
                      controller: _confirm,
                      focusNode: _confirmFocus,
                      hint: 'Confirmar contraseña',
                      obscureText: true,
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
                          'REGISTRARSE',
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

class _Field extends StatelessWidget {
  const _Field({
    required this.controller,
    required this.hint,
    this.focusNode,
    this.keyboardType,
    this.obscureText = false,
    this.autofillHints,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Iterable<String>? autofillHints;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      onSubmitted: onSubmitted,
      style: TextStyle(color: tournament.textColor, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: tournament.placeholderTextColor),
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
