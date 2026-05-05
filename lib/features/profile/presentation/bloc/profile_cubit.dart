import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:quiniela_flutter/core/data/api_client.dart';
import 'package:quiniela_flutter/core/observability/error_reporter.dart';
import 'package:quiniela_flutter/features/profile/presentation/bloc/profile_state.dart';

const _errorSentinel = 'error';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._apiClient) : super(const ProfileState());

  final ApiClient _apiClient;

  Future<void> load() async {
    emit(state.copyWith(loading: true, error: null, saved: false));
    try {
      final profile = await _apiClient.fetchProfile();
      emit(state.copyWith(loading: false, profile: profile));
    } catch (e, stack) {
      await ErrorReporter.capture(e, stack, hint: 'profile_load');
      emit(state.copyWith(loading: false, error: _errorSentinel));
    }
  }

  Future<void> save({
    required String name,
    required String bio,
    String? photoPath,
  }) async {
    emit(state.copyWith(saving: true, error: null, saved: false));
    try {
      final profile = await _apiClient.updateProfile(
        name: name,
        bio: bio,
        photoPath: photoPath,
      );
      emit(state.copyWith(saving: false, profile: profile, saved: true));
    } catch (e, stack) {
      await ErrorReporter.capture(e, stack, hint: 'profile_save');
      emit(state.copyWith(saving: false, error: _errorSentinel));
    }
  }
}
