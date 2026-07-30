import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:meta_mart/core/di/init_dependencies.dart' as di;

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  FlutterError.onError = FlutterError.presentError;

  runApp(await builder());
}
