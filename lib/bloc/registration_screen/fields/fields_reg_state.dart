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
      UtilsFieldValidator.validateEmail(fieldEmail);

  String? get fieldFirstNameIsValid =>
      UtilsFieldValidator.validateText(fieldFirstName);

  String? get fieldLastNameIsValid =>
      UtilsFieldValidator.validateText(fieldLastName);

  String? get fieldPatronymicIsValid =>
      UtilsFieldValidator.validateText(fieldPatronymic);

  String? get fieldPasswordIsValid =>
      UtilsFieldValidator.validatePassword(fieldPassword);

  String? get fieldConfirmPasswordIsValid =>
      UtilsFieldValidator.validateConfirmPassword(
          fieldConfirmPassword, fieldPassword);

  /// валидность всей формы
  bool get isValid =>
      UtilsFieldValidator.validateEmail(fieldEmail) == null &&
      UtilsFieldValidator.validateText(fieldFirstName) == null &&
      UtilsFieldValidator.validateText(fieldLastName) == null &&
      UtilsFieldValidator.validateText(fieldPatronymic) == null &&
      UtilsFieldValidator.validatePassword(fieldPassword) == null &&
      UtilsFieldValidator.validateConfirmPassword(
              fieldConfirmPassword, fieldPassword) ==
          null;
}
