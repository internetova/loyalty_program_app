import 'package:flutter/services.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';

/// validator и formatter для полей форм
class UtilsFieldValidator {
  UtilsFieldValidator._();

  /// валидатор
  ///
  /// корректность E-mail
  static String? validateEmail(String value) {
    if (value.isEmpty) return AppStrings.errorEmptyField;
    if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value))
      return AppStrings.errorIncorrectField;

    return null;
  }

  /// текстовое поле Имя, Отчество, Фамилия
  static String? validateText(String value) {
    if (value.isEmpty) return AppStrings.errorEmptyField;
    if (value.length < 4) return AppStrings.errorIncorrectField;

    return null;
  }

  /// корректность Пароль
  static String? validatePassword(String value) {
    if (value.isEmpty) return AppStrings.errorEmptyField;
    if (value.length < 8) return AppStrings.errorPasswordField;

    return null;
  }

  /// корректность Подтверждение пароля при регистрации
  static String? validateConfirmPassword(String value, String password) {
    if (value.isEmpty) return AppStrings.errorEmptyField;
    if (value.length < 8) return AppStrings.errorPasswordField;
    if (value != password) return AppStrings.errorConfirmPasswordField;

    return null;
  }

  /// inputFormatters
  ///
  /// форматер для E-mail
  static final formatEmail =
      FilteringTextInputFormatter.allow(RegExp(r'[0-9a-zA-Z@.]'));

  /// форматер для Пароль
  static final formatPassword =
      FilteringTextInputFormatter.deny(RegExp(r'[а-яА-Я\s]+'));

  /// форматер для текстового поля без пробелов Имя, Отчество, Фамилия
  static final formatText =
      FilteringTextInputFormatter.allow(RegExp(r'[а-яА-Я]'));
}
