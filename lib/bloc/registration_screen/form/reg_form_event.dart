part of 'reg_form_bloc.dart';

/// события формы
abstract class RegFormEvent extends Equatable {
  const RegFormEvent();
}

/// нажата кнопка зарегистрироваться
class RegFormEventSubmitted extends RegFormEvent {
  /// контекст для отображения подтверждающего диалога об успешной отправке
  final BuildContext context;

  /// передаём состояние заполненных полей формы
  final FieldsRegState fieldsState;

  RegFormEventSubmitted(
      this.context, {
        required this.fieldsState,
      });

  @override
  List<Object?> get props => [fieldsState];
}
