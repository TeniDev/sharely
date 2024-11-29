part of './injection_container.dart';

void _initBlocsInjection() {
  sl
    ..registerFactory(
      () => AppBloc(
        localStorageHelper: sl(),
      ),
    )
    ..registerFactory(
      () => LoginBloc(
        authRepository: sl(),
        secureStorageHelper: sl(),
        localStorageHelper: sl(),
      ),
    );
}
