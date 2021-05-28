import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loyalty_program_app/data/repository/setting_repository.dart';

part 'settings_app_state.dart';

/// настройки приложения
class SettingsAppCubit extends Cubit<SettingsAppState> {
  final SettingRepository _repository;

  SettingsAppCubit(this._repository) : super(SettingsAppState());

  /// загружаем данные пользователя при входе в приложение
  Future<void> initState() async {
    final bool isFirstStart = await _repository.getIsFirstStart();
    final bool isAuthUser = await _repository.getIsAuthUser();
    final String? authUserEmail = await _repository.getEmail();

    emit(SettingsAppState(
      isFirstStart: isFirstStart,
      isAuthUser: isAuthUser,
      authUserEmail: authUserEmail,
      isAppNotReady: false,
    ));
  }

  /// сохраняем первый запуск приложения после удачной регистрации
  Future<void> setIsFirstRun() async {
    await _repository.setIsFirstStart(false);

    emit(state.copyWith(isFirstStart: false));
  }

  /// сохраняем вход юзера и его email
  Future<void> setAuthUser(String authUserEmail) async {
    await _repository.setIsAuthUser(true);
    await _repository.setEmail(authUserEmail);

    emit(state.copyWith(isAuthUser: true, authUserEmail: authUserEmail));
  }

  /// юзер вышел из аккаунта
  Future<void> logoutUser() async {
    await _repository.setIsAuthUser(false);
    await _repository.clearEmail();

    emit(SettingsAppState(
      isFirstStart: false,
      isAppNotReady: false,
      isAuthUser: false,
      authUserEmail: null,
    ));
  }
}
