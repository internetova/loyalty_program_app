import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_program_app/bloc/registration_screen/fields/fields_reg_cubit.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';
import 'package:loyalty_program_app/ui/screens/enter_screen.dart';
import 'package:loyalty_program_app/ui/widgets/inform_dialog_widget.dart';

part 'reg_form_event.dart';

part 'reg_form_state.dart';

/// блок для формы регистрации
class RegFormBloc extends Bloc<RegFormEvent, RegFormState> {
  RegFormBloc() : super(RegFormInitial());

  @override
  Stream<RegFormState> mapEventToState(
    RegFormEvent event,
  ) async* {
    if (event is RegFormEventSubmitted) {
      yield RegFormSubmitting();

      try {
        /// todo сделать лоадер, потом удалить задержку
        await Future.delayed(Duration(seconds: 1));

        /// сюда сохраним данные полей формы
        User user = User(
          email: event.fieldsState.fieldEmail,
          password: event.fieldsState.fieldPassword,
          firstName: event.fieldsState.fieldFirstName,
          lastName: event.fieldsState.fieldLastName,
          patronymic: event.fieldsState.fieldPatronymic,
        );

        /// todo записать в базу данных
        print(user);

        /// подтверждаем сохранение данных
        showDialog(
            context: event.context,
            builder: (_) {
              return InformDialogWidget(
                header: AppStrings.regContentHeader,
                text: AppStrings.regContentText,
                onPressed: () {
                  _onPressed(event.context);
                },
              );
            });

        yield RegFormSubmissionSuccess();
      } catch (e) {
        yield RegFormSubmissionFailed(e as Exception);
        rethrow;
      }
    }
  }

  /// переходим на экран входа, кнопку регистрации скрываем
  void _onPressed(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => EnterScreen(
              isVisibleButtonReg: false,
            )));
  }
}
