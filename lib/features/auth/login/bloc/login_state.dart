part of 'login_bloc.dart';

enum LoginStatus { initial, success, error }

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isLoading,
    required LoginStatus status,
  }) = _LoginState;

  factory LoginState.initial() {
    return const LoginState(
      isLoading: false,
      status: LoginStatus.initial,
    );
  }
}
