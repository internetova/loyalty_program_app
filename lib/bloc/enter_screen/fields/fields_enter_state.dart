part of 'fields_enter_cubit.dart';

/// состояние полей формы входа
class FieldsEnterState extends Equatable {
  final String fieldEmail;
  final String fieldPassword;

  const FieldsEnterState({
    this.fieldEmail = '',
    this.fieldPassword = '',
  });

  @override
  List<Object> get props => [
        fieldEmail,
        fieldPassword,
      ];

  FieldsEnterState copyWith({
    String? fieldEmail,
    String? fieldPassword,
  }) {
    return FieldsEnterState(
      fieldEmail: fieldEmail ?? this.fieldEmail,
      fieldPassword: fieldPassword ?? this.fieldPassword,
    );
  }

  String? get fieldEmailIsValid =>
      UtilsFieldValidator.validateEmail(fieldEmail);

  String? get fieldPasswordIsValid =>
      UtilsFieldValidator.validatePassword(fieldPassword);

  /// валидность всей формы
  bool get isValid =>
      UtilsFieldValidator.validateEmail(fieldEmail) == null &&
      UtilsFieldValidator.validatePassword(fieldPassword) == null;
}
