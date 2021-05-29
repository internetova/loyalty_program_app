part of 'fields_edit_profile_cubit.dart';

/// состояние полей формы редактирования профиля
@immutable
class FieldsEditProfileState {
  final String fieldFirstName;
  final String fieldLastName;
  final String fieldPatronymic;
  final String? fieldBirthdate;
  final String? fieldPhone;

  const FieldsEditProfileState({
    required this.fieldFirstName,
    required this.fieldLastName,
    required this.fieldPatronymic,
    this.fieldBirthdate = '',
    this.fieldPhone = '',
  });

  FieldsEditProfileState copyWith({
    String? fieldFirstName,
    String? fieldLastName,
    String? fieldPatronymic,
    String? fieldBirthdate,
    String? fieldPhone,
  }) {
    return FieldsEditProfileState(
      fieldFirstName: fieldFirstName ?? this.fieldFirstName,
      fieldLastName: fieldLastName ?? this.fieldLastName,
      fieldPatronymic: fieldPatronymic ?? this.fieldPatronymic,
      fieldBirthdate: fieldBirthdate ?? this.fieldBirthdate,
      fieldPhone: fieldPhone ?? this.fieldPhone,
    );
  }

  String? get fieldFirstNameIsValid =>
      FieldValidatorUtils.validateText(fieldFirstName);

  String? get fieldLastNameIsValid =>
      FieldValidatorUtils.validateText(fieldLastName);

  String? get fieldPatronymicIsValid =>
      FieldValidatorUtils.validateText(fieldPatronymic);

  String? get fieldBirthdateIsValid => FieldValidatorUtils.validateBirthdate(fieldBirthdate ?? '');

  String? get fieldPhoneIsValid => FieldValidatorUtils.validatePhone(fieldPhone ?? '');


  /// валидность всей формы
  bool get isValid =>
          FieldValidatorUtils.validateText(fieldFirstName) == null &&
          FieldValidatorUtils.validateText(fieldLastName) == null &&
          FieldValidatorUtils.validateText(fieldPatronymic) == null &&
          FieldValidatorUtils.validateBirthdate(fieldBirthdate ?? '') == null &&
          FieldValidatorUtils.validatePhone(fieldPhone ?? '') == null;
}
