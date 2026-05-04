import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../core/data/api_client.dart';
import '../features/auth/presentation/bloc/auth_cubit.dart';
import '../features/fcm/fcm_service.dart';
import '../features/ongoing/presentation/bloc/ongoing_cubit.dart';
import '../features/predict/data/groups_storage.dart';
import '../features/predict/data/knockout_storage.dart';
import '../features/profile/presentation/bloc/profile_cubit.dart';
import '../features/rankings/presentation/bloc/rankings_cubit.dart';
import '../features/session/bloc/session_cubit.dart';
import '../features/theme/bloc/theme_cubit.dart';
import '../features/theme/domain/app_theme.dart';
import '../features/theme/domain/tournament_theme.dart';
import 'router.dart';

class QuinielaApp extends StatefulWidget {
  const QuinielaApp({super.key});

  @override
  State<QuinielaApp> createState() => _QuinielaAppState();
}

class _QuinielaAppState extends State<QuinielaApp> {
  late final SessionCubit _sessionCubit;
  late final ThemeCubit _themeCubit;
  late final AuthCubit _authCubit;
  late final RankingsCubit _rankingsCubit;
  late final OngoingCubit _ongoingCubit;
  late final ProfileCubit _profileCubit;
  late final dynamic _router;

  final GetIt _getIt = GetIt.instance;

  @override
  void initState() {
    super.initState();
    _sessionCubit = _getIt<SessionCubit>();
    _themeCubit = ThemeCubit();
    _authCubit = _getIt<AuthCubit>();
    _rankingsCubit = _getIt<RankingsCubit>();
    _ongoingCubit = _getIt<OngoingCubit>();
    _profileCubit = _getIt<ProfileCubit>();
    _router = buildRouter(_sessionCubit);

    _sessionCubit.bootstrap();
    _getIt<FcmService>().bootstrap();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _getIt<ApiClient>()),
        RepositoryProvider.value(value: _getIt<GroupsStorage>()),
        RepositoryProvider.value(value: _getIt<KnockoutStorage>()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _sessionCubit),
          BlocProvider.value(value: _themeCubit),
          BlocProvider.value(value: _authCubit),
          BlocProvider.value(value: _rankingsCubit),
          BlocProvider.value(value: _ongoingCubit),
          BlocProvider.value(value: _profileCubit),
        ],
        child: BlocBuilder<ThemeCubit, TournamentTheme>(
          builder: (context, theme) {
            return MaterialApp.router(
              title: 'Quiniela Mundial 2026',
              debugShowCheckedModeBanner: false,
              theme: buildAppTheme(theme),
              routerConfig: _router,
            );
          },
        ),
      ),
    );
  }
}
