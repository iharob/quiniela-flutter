import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:quiniela_flutter/core/data/api_client.dart';
import 'package:quiniela_flutter/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:quiniela_flutter/features/fcm/fcm_service.dart';
import 'package:quiniela_flutter/features/live/presentation/bloc/live_cubit.dart';
import 'package:quiniela_flutter/features/predict/data/groups_storage.dart';
import 'package:quiniela_flutter/features/predict/data/knockout_storage.dart';
import 'package:quiniela_flutter/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:quiniela_flutter/features/rankings/presentation/bloc/rankings_cubit.dart';
import 'package:quiniela_flutter/features/session/bloc/session_cubit.dart';
import 'package:quiniela_flutter/features/theme/bloc/theme_cubit.dart';
import 'package:quiniela_flutter/features/theme/domain/app_theme.dart';
import 'package:quiniela_flutter/features/theme/domain/tournament_theme.dart';
import 'package:quiniela_flutter/app/router.dart';

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
  late final LiveCubit _liveCubit;
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
    _liveCubit = _getIt<LiveCubit>();
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
          BlocProvider.value(value: _liveCubit),
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
