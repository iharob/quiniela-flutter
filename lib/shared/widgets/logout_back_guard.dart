import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quiniela_flutter/features/session/bloc/session_cubit.dart';

class LogoutBackGuard extends StatelessWidget {
  const LogoutBackGuard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final confirmed = await confirmLogout(context);
        if (confirmed && context.mounted) {
          await context.read<SessionCubit>().logout();
        }
      },
      child: child,
    );
  }
}

Future<bool> confirmLogout(BuildContext context) async {
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
