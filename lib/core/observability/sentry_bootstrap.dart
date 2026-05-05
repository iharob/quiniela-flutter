import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

const _defaultDsn =
    'https://276df5944804b44c1f49b56ee0a690e7@o4504186000244736.ingest.us.sentry.io/4511338822828032';

const _dsn = String.fromEnvironment('SENTRY_DSN', defaultValue: _defaultDsn);

const _environment = String.fromEnvironment(
  'SENTRY_ENVIRONMENT',
  defaultValue: kReleaseMode ? 'production' : 'development',
);

Future<void> initSentry(FutureOr<void> Function() appRunner) async {
  if (!kReleaseMode || _dsn.isEmpty) {
    await appRunner();
    return;
  }
  await SentryFlutter.init(
    (options) {
      options.dsn = _dsn;
      options.environment = _environment;
      options.sendDefaultPii = false;
      options.tracesSampleRate = 0.0;
      options.attachStacktrace = true;
    },
    appRunner: appRunner,
  );
}