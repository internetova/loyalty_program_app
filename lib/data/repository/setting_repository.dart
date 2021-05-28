import 'package:loyalty_program_app/data/local_storage/shared_pref_storage.dart';

/// репозиторий для работы с настройками приложения
class SettingRepository {
  final SharedPrefStorage _storage;

  SettingRepository(this._storage);

  /// Первый старт
  /// получить данные
  Future<bool> getIsFirstStart() async => _storage.getIsFirstStart();

  /// сохранить данные
  Future<void> setIsFirstStart(bool isFirstRun) async =>
      _storage.setIsFirstStart(isFirstRun);

  /// E-mail
  /// получить
  Future<String?> getEmail() async => _storage.getEmail();

  Future<bool> getIsAuthUser() async => _storage.getIsAuthUser();

  /// сохранить
  Future<void> setEmail(String email) async => _storage.setEmail(email);

  Future<void> setIsAuthUser(bool isAuthUser) async =>
      _storage.setIsAuthUser(isAuthUser);

  /// Сбросить E-mail при выходе из аккаунта
  Future<void> clearEmail() async => _storage.clearEmail();
}
