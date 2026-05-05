import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quiniela_flutter/core/data/api_client.dart';
import 'package:quiniela_flutter/core/observability/error_reporter.dart';
import 'package:quiniela_flutter/features/score_details/presentation/bloc/score_details_state.dart';

const _errorSentinel = 'error';

class ScoreDetailsCubit extends Cubit<ScoreDetailsState> {
  ScoreDetailsCubit({required ApiClient apiClient, required this.userId})
      : _apiClient = apiClient,
        super(const ScoreDetailsState());

  final ApiClient _apiClient;
  final int userId;
  CancelToken? _cancelToken;

  Future<void> refresh() async {
    _cancelToken?.cancel();
    final token = CancelToken();
    _cancelToken = token;
    emit(state.copyWith(fetching: true, error: null));
    try {
      final data = await _apiClient.getUserScoreDetails(
        userId,
        cancelToken: token,
      );
      debugPrint(
        '[ScoreDetails] fetched user=$userId groups=${data.groups.length} '
        'knockout=${data.knockout.length} final=${data.finalMatch != null}',
      );
      emit(state.copyWith(fetching: false, data: data));
    } on DioException catch (e, stack) {
      if (CancelToken.isCancel(e)) return;
      await ErrorReporter.capture(
        e,
        stack,
        hint: 'score_details_fetch',
        extras: {
          'status': e.response?.statusCode,
          'type': e.type.name,
          'user_id': userId,
        },
      );
      emit(state.copyWith(fetching: false, error: _errorSentinel));
    } catch (e, stack) {
      await ErrorReporter.capture(
        e,
        stack,
        hint: 'score_details_fetch',
        extras: {'user_id': userId},
      );
      emit(state.copyWith(fetching: false, error: _errorSentinel));
    }
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel();
    return super.close();
  }
}
