import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sharely/features/features.dart';

import '../app/bloc/app_bloc.dart';
import '../data/repositories/repositories.dart';
import '../data/resources/resources.dart';
import '../helpers/helpers.dart';

part './network_injection.dart';
part './repository_injection.dart';
part './blocs_injection.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  _initNetworkInjection();
  _initRepositoriesInjection();
  _initBlocsInjection();
}
