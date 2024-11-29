part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loginEvent(String email, String password) = _loginEvent;
  const factory LoginEvent.resetLogin() = _resetLogin;
}
