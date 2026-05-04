import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/api_client.dart';
import 'score_details_state.dart';

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
      final status = e.response?.statusCode;
      final body = e.response?.data;
      debugPrint(
        '[ScoreDetails] DioException type=${e.type} status=$status '
        'message=${e.message} body=$body',
      );
      debugPrintStack(stackTrace: stack);
      emit(state.copyWith(
        fetching: false,
        error: 'HTTP ${status ?? '-'}: ${e.message ?? e.type.name}',
      ));
    } catch (e, stack) {
      debugPrint('[ScoreDetails] unexpected: $e');
      debugPrintStack(stackTrace: stack);
      emit(state.copyWith(fetching: false, error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel();
    return super.close();
  }
}
