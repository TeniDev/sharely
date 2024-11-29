import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sharely/injection/injection_container.dart' as injection;

import '../../app/app_observer.dart';
import '../../helpers/helpers.dart';
import 'firebase_options.dart';

Future<void> initConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Initialize the [BlocObserver]. This will allow us to observe all Blocs and their changes.
  /// This is useful for debugging and logging purposes.
  Bloc.observer = AppObserver();
}

Future<void> initStorage() async {
  final localStorage = injection.sl<LocalStorageHelper>();
  await localStorage.init();
}
