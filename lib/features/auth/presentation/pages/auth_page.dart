import 'package:flutter/material.dart';

import 'email_login_page.dart';
import 'email_register_page.dart';
import 'welcome_page.dart';

enum _AuthView { welcome, login, register }

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  _AuthView _view = _AuthView.welcome;

  void _setView(_AuthView next) => setState(() => _view = next);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: switch (_view) {
          _AuthView.welcome => WelcomePage(
              onNavigateToLogin: () => _setView(_AuthView.login),
              onNavigateToRegister: () => _setView(_AuthView.register),
            ),
          _AuthView.login => EmailLoginPage(
              onBack: () => _setView(_AuthView.welcome),
            ),
          _AuthView.register => EmailRegisterPage(
              onBack: () => _setView(_AuthView.welcome),
            ),
        },
      ),
    );
  }
}
