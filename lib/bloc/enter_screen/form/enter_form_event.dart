part of 'enter_form_bloc.dart';

/// события формы входа
abstract class EnterFormEvent extends Equatable {
  const EnterFormEvent();
}

/// нажата кнопка Войти
class EnterFormEventSubmitted extends EnterFormEvent {
  /// передаём состояние заполненных полей формы
  final FieldsEnterState fieldsState;

  EnterFormEventSubmitted({
    required this.fieldsState,
  });

  @override
  List<Object?> get props => [fieldsState];
}
