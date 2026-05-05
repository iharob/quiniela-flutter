import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// Centralized hand-off for non-fatal errors. UI surfaces a generic message;
/// the raw exception and stack go to Sentry (release builds) or `debugPrint`
/// (debug builds).
class ErrorReporter {
  const ErrorReporter._();

  static Future<void> capture(
    Object exception,
    StackTrace? stack, {
    String? hint,
    Map<String, Object?>? extras,
  }) async {
    if (_isCancellation(exception)) return;
    if (kDebugMode) {
      debugPrint(
        '[ErrorReporter] ${hint != null ? '$hint: ' : ''}$exception',
      );
      if (stack != null) debugPrintStack(stackTrace: stack);
      return;
    }
    await Sentry.captureException(
      exception,
      stackTrace: stack,
      withScope: (scope) {
        if (hint != null) scope.setTag('hint', hint);
        if (extras != null && extras.isNotEmpty) {
          scope.setContexts('extras', extras);
        }
      },
    );
  }

  static bool _isCancellation(Object e) {
    if (e is DioException && CancelToken.isCancel(e)) return true;
    return false;
  }
}
