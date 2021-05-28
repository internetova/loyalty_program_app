part of 'edit_profile_form_bloc.dart';

/// события формы редактирования профиля
abstract class EditProfileFormEvent extends Equatable {
  const EditProfileFormEvent();
}

/// нажата кнопка изменить
class EditProfileFormEventSubmitted extends EditProfileFormEvent {
  /// передаём состояние заполненных полей формы
  final FieldsEditProfileState fieldsState;

  EditProfileFormEventSubmitted(this.fieldsState);

  @override
  List<Object?> get props => [fieldsState];
}
