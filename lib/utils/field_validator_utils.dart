import 'package:flutter/services.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

/// validator и formatter для полей форм
class FieldValidatorUtils {
  FieldValidatorUtils._();

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

  /// дата рождения
  static String? validateBirthdate(String value) {
    if (value.isEmpty) return AppStrings.errorEmptyField;
    if (value.length < 10) return AppStrings.errorIncorrectField;

    return null;
  }

  /// номер телефона
  static String? validatePhone(String value) {
    if (value.isEmpty) return AppStrings.errorEmptyField;
    if (value.length < 18) return AppStrings.errorIncorrectField;

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

  /// форматер для чисел без
  static final formatNumber =
  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'));

  /// форматер для даты 23.05.1974
  static final formatDate = MaskTextInputFormatter(mask: "##.##.####");

  /// форматер для телефона
  static final formatPhone = MaskTextInputFormatter(mask: "+# (###) ###-##-##");
}
