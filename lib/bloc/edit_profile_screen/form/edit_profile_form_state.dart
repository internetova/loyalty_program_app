part of 'edit_profile_form_bloc.dart';

/// состояния формы редактирования профиля
abstract class EditProfileFormState extends Equatable {
  const EditProfileFormState();
}

/// инициализация
/// кнопка отправки формы не активна
class EditProfileFormInitial extends EditProfileFormState {
  final bool isEnabled;

  EditProfileFormInitial({this.isEnabled = false});

  @override
  List<Object> get props => [isEnabled];
}

/// отправляется
class EditProfileFormSubmitting extends EditProfileFormState {
  @override
  List<Object?> get props => [];
}

/// отправлено успешно
class EditProfileFormSubmissionSuccess extends EditProfileFormState {
  @override
  List<Object?> get props => [];
}

/// неудача
class EditProfileFormSubmissionFailed extends EditProfileFormState {
  final Exception exception;

  EditProfileFormSubmissionFailed(this.exception);

  @override
  List<Object?> get props => [exception];
}
