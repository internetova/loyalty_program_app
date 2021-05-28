part of 'fields_edit_profile_cubit.dart';

/// состояние полей формы редактирования профиля
class FieldsEditProfileState extends Equatable {
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

  @override
  List<Object> get props => [
    fieldFirstName,
    fieldLastName,
    fieldPatronymic,
  ];

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


  /// валидность всей формы
  /// день рождения и телефон не обязательны
  bool get isValid =>
          FieldValidatorUtils.validateText(fieldFirstName) == null &&
          FieldValidatorUtils.validateText(fieldLastName) == null &&
          FieldValidatorUtils.validateText(fieldPatronymic) == null;
}
