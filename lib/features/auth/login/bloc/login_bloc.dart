import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sharely/core/router/router.dart';
import 'package:sharely_ui/sharely_ui.dart';

import '../../../../core/utils/utils.dart';
import '../../../../data/models/models.dart';
import '../../../../data/repositories/repositories.dart';
import '../../../../helpers/helpers.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthRepository authRepository,
    required SecureStorageHelper secureStorageHelper,
    required LocalStorageHelper localStorageHelper,
  })  : _authRepository = authRepository,
        _secureStorageHelper = secureStorageHelper,
        _localStorageHelper = localStorageHelper,
        super(LoginState.initial()) {
    on<LoginEvent>(
      (events, emit) => events.map(
        loginEvent: (event) => _loginEvent(emit, event.email, event.password),
        resetLogin: (_) => _resetLogin(emit),
      ),
    );
  }

  final AuthRepository _authRepository;
  final SecureStorageHelper _secureStorageHelper;
  final LocalStorageHelper _localStorageHelper;

  _loginEvent(Emitter<LoginState> emit, String email, String password) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    unawaited(startLoadingModal(rootNavigatorKey.currentContext!));

    final response = await _authRepository.login(
      loginRequest: LoginRequestModel(
        email: email,
        password: password,
      ),
    );

    await stopLoadingModal(rootNavigatorKey.currentContext!);

    return response.fold(
      (l) async {
        logger.error('Error: $l');
        emit(
          state.copyWith(
            isLoading: false,
            status: LoginStatus.error,
          ),
        );
        unawaited(
          showErrorModal(
            error: l.message,
            context: rootNavigatorKey.currentContext!,
          ),
        );
      },
      (r) async {
        await _secureStorageHelper.setToken(r.id);

        // TODO get user data

        emit(
          state.copyWith(
            isLoading: false,
            status: LoginStatus.success,
          ),
        );
      },
    );
  }

  _resetLogin(Emitter<LoginState> emit) {
    emit(
      LoginState.initial(),
    );
  }
}
