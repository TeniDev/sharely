part of './injection_container.dart';

void _initNetworkInjection() {
  sl
    ..registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    )
    ..registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    )
    ..registerLazySingleton<LocalStorageHelper>(
      () => LocalStorageHelper(
        hive: Hive,
      ),
    )
    ..registerLazySingleton<SecureStorageHelper>(
      () => SecureStorageHelper(),
    );
}
