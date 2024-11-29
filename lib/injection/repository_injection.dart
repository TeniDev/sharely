part of './injection_container.dart';

_initRepositoriesInjection() {
  sl
    ..registerLazySingleton<AuthRepository>(
      () => AuthFirebaseResource(
        firebaseAuth: sl(),
      ),
    )
    ..registerLazySingleton<UserRepository>(
      () => UserFirebaseResource(
        firebaseFirestore: sl(),
      ),
    );
}
