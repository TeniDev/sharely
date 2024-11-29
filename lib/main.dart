import 'package:flutter/material.dart';
import 'package:sharely/injection/injection_container.dart' as injection;

import 'app/app.dart';
import 'core/config/config.dart';

Future<void> main() async {
  initConfig();
  await injection.initInjections();
  initStorage();
  runApp(
    const SharelyApp(),
  );
}
