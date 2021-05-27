part of 'enter_form_bloc.dart';

/// состояния формы входа
abstract class EnterFormState extends Equatable {
  const EnterFormState();
}

/// инициализация
/// кнопка отправки формы не активна
class EnterFormInitial extends EnterFormState {
  final bool isEnabled;

  EnterFormInitial({this.isEnabled = false});

  @override
  List<Object> get props => [isEnabled];
}

/// отправляется
class EnterFormSubmitting extends EnterFormState {
  @override
  List<Object?> get props => [];
}

/// юзер вошёл успешно
class EnterFormSubmissionSuccess extends EnterFormState {
  final String userEmail;

  EnterFormSubmissionSuccess(this.userEmail);

  @override
  List<Object?> get props => [userEmail];
}


/// неудача
class EnterFormSubmissionFailed extends EnterFormState {
  final Exception exception;

  EnterFormSubmissionFailed(this.exception);

  @override
  List<Object?> get props => [exception];
}
