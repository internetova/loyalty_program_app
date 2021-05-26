import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loyalty_program_app/bloc/enter_screen/fields/fields_enter_cubit.dart';

part 'enter_form_event.dart';
part 'enter_form_state.dart';

/// блок для экрана входа
class EnterFormBloc extends Bloc<EnterFormEvent, EnterFormState> {
  EnterFormBloc() : super(EnterFormInitial());

  @override
  Stream<EnterFormState> mapEventToState(
    EnterFormEvent event,
  ) async* {
    if (event is EnterFormEventSubmitted) {
      yield EnterFormSubmitting();

      try {
        /// todo сделать лоадер, потом удалить задержку
        await Future.delayed(Duration(seconds: 1));

        /// запрос к базе данных с проверкой юзера
        // если пользователь есть
        print(event.fieldsState);

        yield EnterFormSubmissionSuccess();
      } catch (e) {
        yield EnterFormSubmissionFailed(e as Exception);
        rethrow;
      }
    }
  }
}
