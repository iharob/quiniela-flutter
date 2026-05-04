// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/presentation/bloc/auth_cubit.dart' as _i52;
import '../../features/fcm/fcm_service.dart' as _i1072;
import '../../features/ongoing/presentation/bloc/ongoing_cubit.dart' as _i208;
import '../../features/predict/data/groups_storage.dart' as _i799;
import '../../features/predict/data/knockout_storage.dart' as _i654;
import '../../features/profile/presentation/bloc/profile_cubit.dart' as _i800;
import '../../features/rankings/presentation/bloc/rankings_cubit.dart' as _i690;
import '../../features/session/bloc/session_cubit.dart' as _i739;
import '../../features/session/data/session_storage.dart' as _i643;
import '../data/api_client.dart' as _i750;
import '../utils/auth_token_holder.dart' as _i88;
import 'dio_module.dart' as _i1045;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.lazySingleton<_i88.AuthTokenHolder>(() => _i88.AuthTokenHolder());
    gh.lazySingleton<_i654.KnockoutStorage>(
        () => _i654.KnockoutStorage(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i799.GroupsStorage>(
        () => _i799.GroupsStorage(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i643.SessionStorage>(
        () => _i643.SessionStorage(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i361.Dio>(
        () => dioModule.dio(gh<_i88.AuthTokenHolder>()));
    gh.lazySingleton<_i750.ApiClient>(() => _i750.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i690.RankingsCubit>(
        () => _i690.RankingsCubit(gh<_i750.ApiClient>()));
    gh.factory<_i208.OngoingCubit>(
        () => _i208.OngoingCubit(gh<_i750.ApiClient>()));
    gh.factory<_i800.ProfileCubit>(
        () => _i800.ProfileCubit(gh<_i750.ApiClient>()));
    gh.lazySingleton<_i1072.FcmService>(
        () => _i1072.FcmService(gh<_i208.OngoingCubit>()));
    gh.lazySingleton<_i739.SessionCubit>(() => _i739.SessionCubit(
          gh<_i643.SessionStorage>(),
          gh<_i88.AuthTokenHolder>(),
          gh<_i750.ApiClient>(),
        ));
    gh.factory<_i52.AuthCubit>(() => _i52.AuthCubit(
          gh<_i750.ApiClient>(),
          gh<_i739.SessionCubit>(),
          gh<_i116.GoogleSignIn>(),
        ));
    return this;
  }
}

class _$DioModule extends _i1045.DioModule {}
