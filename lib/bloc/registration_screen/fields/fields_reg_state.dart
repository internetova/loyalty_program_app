part of 'fields_reg_cubit.dart';

/// состояние полей формы регистрации
class FieldsRegState extends Equatable {
  final String fieldEmail;
  final String fieldFirstName;
  final String fieldLastName;
  final String fieldPatronymic;
  final String fieldPassword;
  final String fieldConfirmPassword;

  const FieldsRegState({
    this.fieldEmail = '',
    this.fieldFirstName = '',
    this.fieldLastName = '',
    this.fieldPatronymic = '',
    this.fieldPassword = '',
    this.fieldConfirmPassword = '',
  });

  @override
  List<Object> get props => [
        fieldEmail,
        fieldFirstName,
        fieldLastName,
        fieldPatronymic,
        fieldPassword,
        fieldConfirmPassword,
      ];

  FieldsRegState copyWith({
    String? fieldEmail,
    String? fieldFirstName,
    String? fieldLastName,
    String? fieldPatronymic,
    String? fieldPassword,
    String? fieldConfirmPassword,
  }) {
    return FieldsRegState(
      fieldEmail: fieldEmail ?? this.fieldEmail,
      fieldFirstName: fieldFirstName ?? this.fieldFirstName,
      fieldLastName: fieldLastName ?? this.fieldLastName,
      fieldPatronymic: fieldPatronymic ?? this.fieldPatronymic,
      fieldPassword: fieldPassword ?? this.fieldPassword,
      fieldConfirmPassword: fieldConfirmPassword ?? this.fieldConfirmPassword,
    );
  }

  String? get fieldEmailIsValid =>
      FieldValidatorUtils.validateEmail(fieldEmail);

  String? get fieldFirstNameIsValid =>
      FieldValidatorUtils.validateText(fieldFirstName);

  String? get fieldLastNameIsValid =>
      FieldValidatorUtils.validateText(fieldLastName);

  String? get fieldPatronymicIsValid =>
      FieldValidatorUtils.validateText(fieldPatronymic);

  String? get fieldPasswordIsValid =>
      FieldValidatorUtils.validatePassword(fieldPassword);

  String? get fieldConfirmPasswordIsValid =>
      FieldValidatorUtils.validateConfirmPassword(
          fieldConfirmPassword, fieldPassword);

  /// валидность всей формы
  bool get isValid =>
      FieldValidatorUtils.validateEmail(fieldEmail) == null &&
      FieldValidatorUtils.validateText(fieldFirstName) == null &&
      FieldValidatorUtils.validateText(fieldLastName) == null &&
      FieldValidatorUtils.validateText(fieldPatronymic) == null &&
      FieldValidatorUtils.validatePassword(fieldPassword) == null &&
      FieldValidatorUtils.validateConfirmPassword(
              fieldConfirmPassword, fieldPassword) ==
          null;
}
