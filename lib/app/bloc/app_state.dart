part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required bool isLoading,
    required UserModel? currentUser,
  }) = _AppState;

  factory AppState.initial() {
    return const AppState(
      isLoading: false,
      currentUser: null,
    );
  }
}
