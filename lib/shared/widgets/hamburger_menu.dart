import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/session/bloc/session_cubit.dart';
import '../../features/theme/domain/tournament_theme.dart';

enum _MenuAction { settings, rules, logout }

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  Future<bool> _confirmLogout(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text('¿Estás seguro que deseas cerrar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Cerrar sesión'),
          ),
        ],
      ),
    );
    return result == true;
  }

  Future<void> _handleSelection(
    BuildContext context,
    _MenuAction action,
  ) async {
    switch (action) {
      case _MenuAction.settings:
        context.push('/settings');
      case _MenuAction.rules:
        context.push('/rules');
      case _MenuAction.logout:
        final confirmed = await _confirmLogout(context);
        if (confirmed && context.mounted) {
          await context.read<SessionCubit>().logout();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return PopupMenuButton<_MenuAction>(
      tooltip: 'Menú',
      icon: Icon(Icons.menu, color: tournament.contrastTextColor),
      onSelected: (action) => _handleSelection(context, action),
      itemBuilder: (_) => const [
        PopupMenuItem(
          value: _MenuAction.settings,
          child: ListTile(
            dense: true,
            leading: Icon(Icons.settings, color: Color(0xFF1F1F1F)),
            title: Text('Ajustes'),
          ),
        ),
        PopupMenuItem(
          value: _MenuAction.rules,
          child: ListTile(
            dense: true,
            leading: Icon(Icons.balance, color: Color(0xFF1F1F1F)),
            title: Text('Reglas'),
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          value: _MenuAction.logout,
          child: ListTile(
            dense: true,
            leading: Icon(Icons.logout, color: Color(0xFFC00000)),
            title: Text(
              'Cerrar sesión',
              style: TextStyle(color: Color(0xFFC00000)),
            ),
          ),
        ),
      ],
    );
  }
}
