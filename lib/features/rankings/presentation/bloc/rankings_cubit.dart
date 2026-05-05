import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:quiniela_flutter/core/data/api_client.dart';
import 'package:quiniela_flutter/core/observability/error_reporter.dart';
import 'package:quiniela_flutter/features/rankings/presentation/bloc/rankings_state.dart';

const _errorSentinel = 'error';

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
      await ErrorReporter.capture(
        e,
        stack,
        hint: 'rankings_fetch',
        extras: {'status': e.response?.statusCode, 'type': e.type.name},
      );
      emit(state.copyWith(fetching: false, error: _errorSentinel));
    } catch (e, stack) {
      await ErrorReporter.capture(e, stack, hint: 'rankings_fetch');
      emit(state.copyWith(fetching: false, error: _errorSentinel));
    }
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel();
    return super.close();
  }
}
