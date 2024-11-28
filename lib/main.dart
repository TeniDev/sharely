import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/config/config.dart';

Future<void> main() async {
  initConfig();
  runApp(
    const SharelyApp(),
  );
}
