import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:quiniela_flutter/features/session/bloc/session_cubit.dart';
import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';

enum _MenuAction { settings, rules, logout }

const double _menuWidth = 240;
const double _menuOffset = 6;

class HamburgerMenu extends StatefulWidget {
  const HamburgerMenu({super.key});

  @override
  State<HamburgerMenu> createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu>
    with SingleTickerProviderStateMixin {
  final GlobalKey _buttonKey = GlobalKey();
  late final AnimationController _ctrl;
  OverlayEntry? _entry;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 170),
      reverseDuration: const Duration(milliseconds: 120),
    );
  }

  @override
  void dispose() {
    _ctrl.stop();
    _entry?.remove();
    _entry = null;
    _ctrl.dispose();
    super.dispose();
  }

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

  Future<void> _handleSelection(_MenuAction action) async {
    await _close();
    if (!mounted) return;
    switch (action) {
      case _MenuAction.settings:
        context.push('/settings');
      case _MenuAction.rules:
        context.push('/rules');
      case _MenuAction.logout:
        final confirmed = await _confirmLogout(context);
        if (confirmed && mounted) {
          await context.read<SessionCubit>().logout();
        }
    }
  }

  void _open() {
    if (_entry != null) return;
    final overlay = Overlay.of(context, rootOverlay: true);
    final tournament = context.tournamentTheme;
    final box = _buttonKey.currentContext!.findRenderObject() as RenderBox;
    final overlayBox = overlay.context.findRenderObject() as RenderBox;
    final btnTopRight = box.localToGlobal(
      Offset(box.size.width, box.size.height),
      ancestor: overlayBox,
    );
    final overlaySize = overlayBox.size;

    _entry = OverlayEntry(
      builder: (_) => _MenuOverlay(
        animation: _ctrl,
        onDismiss: _close,
        anchorRight: overlaySize.width - btnTopRight.dx,
        anchorTop: btnTopRight.dy + _menuOffset,
        tournament: tournament,
        onSelect: _handleSelection,
      ),
    );
    overlay.insert(_entry!);
    _ctrl.forward(from: 0);
  }

  Future<void> _close() async {
    if (_entry == null) return;
    try {
      await _ctrl.reverse();
    } on TickerCanceled {
      // ignore — widget was disposed mid-animation
    }
    _entry?.remove();
    _entry = null;
  }

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        key: _buttonKey,
        tooltip: 'Menú',
        icon: Icon(Icons.menu, color: tournament.contrastTextColor),
        onPressed: _open,
      ),
    );
  }
}

class _MenuOverlay extends StatelessWidget {
  const _MenuOverlay({
    required this.animation,
    required this.onDismiss,
    required this.anchorRight,
    required this.anchorTop,
    required this.tournament,
    required this.onSelect,
  });

  final Animation<double> animation;
  final VoidCallback onDismiss;
  final double anchorRight;
  final double anchorTop;
  final TournamentTheme tournament;
  final ValueChanged<_MenuAction> onSelect;

  @override
  Widget build(BuildContext context) {
    final fade = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
    final slide = Tween<Offset>(
      begin: const Offset(0, -0.04),
      end: Offset.zero,
    ).animate(fade);

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onDismiss,
          ),
        ),
        Positioned(
          top: anchorTop,
          right: anchorRight,
          child: FadeTransition(
            opacity: fade,
            child: SlideTransition(
              position: slide,
              child: _MenuCard(onSelect: onSelect),
            ),
          ),
        ),
      ],
    );
  }
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({required this.onSelect});

  final ValueChanged<_MenuAction> onSelect;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: _menuWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _MenuRow(
                icon: Icons.settings,
                label: 'Ajustes',
                onTap: () => onSelect(_MenuAction.settings),
              ),
              _MenuRow(
                icon: Icons.balance,
                label: 'Reglas',
                onTap: () => onSelect(_MenuAction.rules),
              ),
              const Divider(height: 1, thickness: 1, color: Colors.black12),
              _MenuRow(
                icon: Icons.logout,
                label: 'Cerrar sesión',
                color: const Color(0xFFC00000),
                onTap: () => onSelect(_MenuAction.logout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  const _MenuRow({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final fg = color ?? const Color(0xFF1F1F1F);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 20, color: fg),
            const SizedBox(width: 14),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: fg,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
