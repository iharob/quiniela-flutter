import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:quiniela_flutter/shared/widgets/hamburger_menu.dart';
import 'package:quiniela_flutter/shared/widgets/logout_back_guard.dart';
import 'package:quiniela_flutter/features/ongoing/presentation/pages/ongoing_page.dart';
import 'package:quiniela_flutter/features/rankings/presentation/pages/rankings_page.dart';
import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';

class TabbedPage extends StatefulWidget {
  const TabbedPage({super.key});

  @override
  State<TabbedPage> createState() => _TabbedPageState();
}

class _TabbedPageState extends State<TabbedPage> {
  int _index = 0;

  static const List<_Tab> _tabs = [
    _Tab(
        label: 'Posiciones',
        icon: Icons.emoji_events_outlined,
        page: RankingsPage()),
    _Tab(
        label: 'Jugando',
        icon: Icons.satellite_alt_outlined,
        page: OngoingPage()),
  ];

  @override
  Widget build(BuildContext context) {
    final tournament = context.tournamentTheme;
    return LogoutBackGuard(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: tournament.cardColor,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Quiniela Mundial 2026'),
            actions: const [HamburgerMenu()],
          ),
          body: IndexedStack(
            index: _index,
            children: _tabs.map((t) => t.page).toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: (i) => setState(() => _index = i),
            backgroundColor: tournament.cardColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color(0x66FFFFFF),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: _tabs
                .map(
                  (t) => BottomNavigationBarItem(
                    icon: Icon(t.icon),
                    label: t.label,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _Tab {
  const _Tab({required this.label, required this.icon, required this.page});
  final String label;
  final IconData icon;
  final Widget page;
}
