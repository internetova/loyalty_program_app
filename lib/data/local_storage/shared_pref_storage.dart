import 'package:shared_preferences/shared_preferences.dart';

/// локальное хранилище настроек программы
class SharedPrefStorage {
  SharedPreferences? _prefs;

  /// первый запуск приложения
  final String _keyIsFirstStart = '_keyIsFirstStart';

  /// идентификатор юзера - email
  /// если есть и это не первый запуск, то открываем сразу кабинет
  final String _keyIsAuthUser = '_keyIsAuthUser';
  final String _keyEmail = '_keyEmail';


  /// загружаем и анализируем данные с диска
  Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Первый запуск приложения [isFirstStart] - сохраняем
  Future<void> setIsFirstStart(bool isFirstRun) async {
    await _initPrefs();
    await _prefs?.setBool(_keyIsFirstStart, isFirstRun);
  }

  /// Первый запуск приложения [isFirstStart] - получаем
  Future<bool> getIsFirstStart() async {
    await _initPrefs();
    return _prefs?.getBool(_keyIsFirstStart) ?? true;
  }

  /// E-mail - сохраняем
  Future<void> setEmail(String email) async {
    await _initPrefs();
    await _prefs?.setString(_keyEmail, email);
  }

  Future<void> setIsAuthUser(bool isAuthUser) async {
    await _initPrefs();
    await _prefs?.setBool(_keyIsAuthUser, isAuthUser);
  }

  /// E-mail - получаем
  Future<String?> getEmail() async {
    await _initPrefs();
    return _prefs?.getString(_keyEmail) ?? null;
  }

  Future<bool> getIsAuthUser() async {
    await _initPrefs();
    return _prefs?.getBool(_keyIsAuthUser) ?? false;
  }

  /// Сбросить E-mail при выходе из аккаунта
  Future<void> clearEmail() async {
    await _initPrefs();
    _prefs?.remove(_keyEmail);
  }
}