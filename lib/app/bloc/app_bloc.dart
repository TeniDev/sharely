import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sharely/core/router/router.dart';
import 'package:sharely_ui/sharely_ui.dart';

import '../../core/constants/constants.dart';
import '../../core/utils/utils.dart';
import '../../data/models/models.dart';
import '../../helpers/helpers.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required LocalStorageHelper localStorageHelper,
  })  : _localStorageHelper = localStorageHelper,
        super(AppState.initial()) {
    on<AppEvent>(
      (events, emit) => events.map(
        loadUserData: (_) => _loadUserData(emit),
      ),
    );
  }

  final LocalStorageHelper _localStorageHelper;

  _loadUserData(Emitter<AppState> emit) async {
    emit(state.copyWith(isLoading: true));
    unawaited(startLoadingModal(rootNavigatorKey.currentContext!));
    try {
      final user = await _localStorageHelper.read(key: LocalStorageConstants.userKey);

      emit(
        state.copyWith(
          isLoading: false,
          currentUser: UserModel.fromJson(jsonDecode(user ?? '{}')),
        ),
      );

      await stopLoadingModal(rootNavigatorKey.currentContext!);
    } catch (e) {
      logger.error(e.toString());
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
      await stopLoadingModal(rootNavigatorKey.currentContext!);
    }
  }
}
