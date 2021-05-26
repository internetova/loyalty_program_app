part of 'reg_form_bloc.dart';

abstract class RegFormState extends Equatable {
  const RegFormState();
}

/// инициализация
/// кнопка отправки формы не активна
class RegFormInitial extends RegFormState {
  final bool isEnabled;

  RegFormInitial({this.isEnabled = false});

  @override
  List<Object> get props => [isEnabled];
}

/// отправляется
class RegFormSubmitting extends RegFormState {
  @override
  List<Object?> get props => [];
}

/// отправлено успешно
class RegFormSubmissionSuccess extends RegFormState {
  @override
  List<Object?> get props => [];
}


/// неудача
class RegFormSubmissionFailed extends RegFormState {
  final Exception exception;

  RegFormSubmissionFailed(this.exception);

  @override
  List<Object?> get props => [exception];
}