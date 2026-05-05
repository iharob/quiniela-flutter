import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:quiniela_flutter/core/domain/game.dart';
import 'package:quiniela_flutter/features/auth/presentation/pages/auth_page.dart';
import 'package:quiniela_flutter/features/participants/presentation/pages/rules_page.dart';
import 'package:quiniela_flutter/features/participants/presentation/pages/tabbed_page.dart';
import 'package:quiniela_flutter/features/predict/presentation/pages/final_page.dart';
import 'package:quiniela_flutter/features/predict/presentation/pages/groups_page.dart';
import 'package:quiniela_flutter/features/predict/presentation/pages/knockout_nav_args.dart';
import 'package:quiniela_flutter/features/predict/presentation/pages/knockout_page.dart';
import 'package:quiniela_flutter/features/predict/presentation/pages/predict_shell.dart';
import 'package:quiniela_flutter/features/profile/presentation/pages/profile_page.dart';
import 'package:quiniela_flutter/features/rankings/presentation/pages/rankings_page.dart';
import 'package:quiniela_flutter/features/score_details/bloc/score_details_cubit_provider.dart';
import 'package:quiniela_flutter/features/score_details/presentation/pages/score_details_page.dart';
import 'package:quiniela_flutter/features/session/bloc/session_cubit.dart';
import 'package:quiniela_flutter/shared/widgets/splash_screen.dart';

GoRouter buildRouter(SessionCubit sessionCubit) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: _SessionListenable(sessionCubit),
    redirect: (context, state) {
      final loc = state.matchedLocation;
      return sessionCubit.state.when(
        initializing: () => loc == '/' ? null : '/',
        unauthenticated: () => loc == '/auth' ? null : '/auth',
        authenticated: (session) {
          if (loc == '/' || loc == '/auth') {
            return session.predicted ? '/participants' : '/predict';
          }
          if (session.predicted && loc.startsWith('/predict')) {
            return '/participants';
          }
          if (!session.predicted && loc.startsWith('/participants')) {
            return '/predict';
          }
          return null;
        },
      );
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (_, __) => const AuthPage(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          final session = sessionCubit.currentSession!;
          return PredictShell(userId: session.userId, child: child);
        },
        routes: [
          GoRoute(
            path: '/predict',
            builder: (_, __) => const GroupsPage(),
          ),
          GoRoute(
            path: '/predict/knockout',
            builder: (context, state) {
              final args = state.extra as KnockoutNavArgs;
              return KnockoutPage(args: args);
            },
          ),
          GoRoute(
            path: '/predict/final',
            builder: (context, state) {
              final game = state.extra as GameWithResult;
              return FinalPage(initialGame: game);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/participants',
        builder: (_, __) => const TabbedPage(),
      ),
      GoRoute(
        path: '/score-details/:userId',
        builder: (context, state) {
          final userId = int.parse(state.pathParameters['userId']!);
          final args = state.extra as ScoreDetailsArgs?;
          return ScoreDetailsCubitProvider(
            userId: userId,
            child: ScoreDetailsPage(
              userId: userId,
              userName: args?.userName ?? '',
              photoUrl: args?.photoUrl,
              bio: args?.bio,
            ),
          );
        },
      ),
      GoRoute(
        path: '/settings',
        builder: (_, __) => const ProfilePage(),
      ),
      GoRoute(
        path: '/rules',
        builder: (_, __) => const RulesPage(),
      ),
    ],
  );
}

class _SessionListenable extends ChangeNotifier {
  _SessionListenable(SessionCubit cubit) {
    _sub = cubit.stream.listen((_) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _sub;

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}
