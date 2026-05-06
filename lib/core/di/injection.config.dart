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
import 'package:quiniela_flutter/core/data/api_client.dart' as _i308;
import 'package:quiniela_flutter/core/di/dio_module.dart' as _i217;
import 'package:quiniela_flutter/core/utils/auth_token_holder.dart' as _i1006;
import 'package:quiniela_flutter/features/auth/presentation/bloc/auth_cubit.dart'
    as _i868;
import 'package:quiniela_flutter/features/fcm/fcm_service.dart' as _i198;
import 'package:quiniela_flutter/features/live/presentation/bloc/live_cubit.dart'
    as _i789;
import 'package:quiniela_flutter/features/predict/data/groups_storage.dart'
    as _i204;
import 'package:quiniela_flutter/features/predict/data/knockout_storage.dart'
    as _i663;
import 'package:quiniela_flutter/features/profile/presentation/bloc/profile_cubit.dart'
    as _i131;
import 'package:quiniela_flutter/features/rankings/presentation/bloc/rankings_cubit.dart'
    as _i736;
import 'package:quiniela_flutter/features/session/bloc/session_cubit.dart'
    as _i986;
import 'package:quiniela_flutter/features/session/data/session_storage.dart'
    as _i180;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

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
    gh.lazySingleton<_i1006.AuthTokenHolder>(() => _i1006.AuthTokenHolder());
    gh.lazySingleton<_i663.KnockoutStorage>(
        () => _i663.KnockoutStorage(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i204.GroupsStorage>(
        () => _i204.GroupsStorage(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i180.SessionStorage>(
        () => _i180.SessionStorage(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i361.Dio>(
        () => dioModule.dio(gh<_i1006.AuthTokenHolder>()));
    gh.lazySingleton<_i308.ApiClient>(() => _i308.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i736.RankingsCubit>(
        () => _i736.RankingsCubit(gh<_i308.ApiClient>()));
    gh.factory<_i789.LiveCubit>(() => _i789.LiveCubit(gh<_i308.ApiClient>()));
    gh.factory<_i131.ProfileCubit>(
        () => _i131.ProfileCubit(gh<_i308.ApiClient>()));
    gh.lazySingleton<_i986.SessionCubit>(() => _i986.SessionCubit(
          gh<_i180.SessionStorage>(),
          gh<_i1006.AuthTokenHolder>(),
          gh<_i308.ApiClient>(),
        ));
    gh.factory<_i868.AuthCubit>(() => _i868.AuthCubit(
          gh<_i308.ApiClient>(),
          gh<_i986.SessionCubit>(),
          gh<_i116.GoogleSignIn>(),
        ));
    gh.lazySingleton<_i198.FcmService>(
        () => _i198.FcmService(gh<_i789.LiveCubit>()));
    return this;
  }
}

class _$DioModule extends _i217.DioModule {}
