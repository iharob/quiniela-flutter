import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:quiniela_flutter/core/data/api_client.dart';
import 'package:quiniela_flutter/core/domain/user_results.dart';
import 'package:quiniela_flutter/core/observability/error_reporter.dart';
import 'package:quiniela_flutter/features/live/presentation/bloc/live_state.dart';

const _errorSentinel = 'error';

@injectable
class LiveCubit extends Cubit<LiveState> {
  LiveCubit(this._apiClient) : super(const LiveState());

  final ApiClient _apiClient;
  CancelToken? _cancelToken;

  Future<void> refresh() async {
    _cancelToken?.cancel();
    final token = CancelToken();
    _cancelToken = token;
    emit(state.copyWith(fetching: true, error: null));
    try {
      final groups = await _apiClient.fetchLive(cancelToken: token);
      debugPrint('[Live] fetched ${groups.length} groups');
      emit(state.copyWith(fetching: false, groups: groups));
    } on DioException catch (e, stack) {
      if (CancelToken.isCancel(e)) return;
      await ErrorReporter.capture(
        e,
        stack,
        hint: 'live_fetch',
        extras: {'status': e.response?.statusCode, 'type': e.type.name},
      );
      emit(state.copyWith(fetching: false, error: _errorSentinel));
    } catch (e, stack) {
      await ErrorReporter.capture(e, stack, hint: 'live_fetch');
      emit(state.copyWith(fetching: false, error: _errorSentinel));
    }
  }

  /// Apply a live score update from FCM. Called by [FcmService] without making
  /// a network request — replaces or appends [LiveScore] for the matching pair.
  void applyLiveScore({
    required String team1Country,
    required String team2Country,
    required LiveScore liveScore,
  }) {
    final updated = state.groups
        .map(
          (g) => g.team1.country == team1Country && g.team2.country == team2Country
              ? g.copyWith(liveScore: liveScore)
              : g,
        )
        .toList();
    emit(state.copyWith(groups: updated));
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel();
    return super.close();
  }
}
