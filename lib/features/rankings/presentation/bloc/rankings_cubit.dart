import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/api_client.dart';
import 'rankings_state.dart';

@injectable
class RankingsCubit extends Cubit<RankingsState> {
  RankingsCubit(this._apiClient) : super(const RankingsState());

  final ApiClient _apiClient;
  CancelToken? _cancelToken;

  Future<void> refresh() async {
    _cancelToken?.cancel();
    final token = CancelToken();
    _cancelToken = token;
    emit(state.copyWith(fetching: true, error: null));
    try {
      final entries = await _apiClient.fetchRankings(cancelToken: token);
      debugPrint('[Rankings] fetched ${entries.length} entries');
      emit(state.copyWith(fetching: false, entries: entries));
    } on DioException catch (e, stack) {
      if (CancelToken.isCancel(e)) return;
      final status = e.response?.statusCode;
      final body = e.response?.data;
      debugPrint(
        '[Rankings] DioException type=${e.type} status=$status '
        'message=${e.message} body=$body',
      );
      debugPrintStack(stackTrace: stack);
      emit(state.copyWith(
        fetching: false,
        error: 'HTTP ${status ?? '-'}: ${e.message ?? e.type.name}',
      ));
    } catch (e, stack) {
      debugPrint('[Rankings] unexpected: $e');
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
