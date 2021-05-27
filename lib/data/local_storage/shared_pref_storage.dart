import 'package:shared_preferences/shared_preferences.dart';

/// локальное хранилище настроек программы
class SharedPrefStorage {
  SharedPreferences? _prefs;

  /// первый запуск приложения
  final String _keyIsFirstStart = '_keyIsFirstStart';

  /// идентификатор юзера - email
  /// если есть и это не первый запуск, то открываем сразу кабинет
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

  /// E-mail - получаем
  Future<String?> getEmail() async {
    await _initPrefs();
    return _prefs?.getString(_keyEmail) ?? null;
  }
}