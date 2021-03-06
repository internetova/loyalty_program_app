import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_program_app/bloc/enter_screen/fields/fields_enter_cubit.dart';
import 'package:loyalty_program_app/bloc/enter_screen/form/enter_form_bloc.dart';
import 'package:loyalty_program_app/bloc/registration_screen/fields/fields_reg_cubit.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/data/repository/setting_repository.dart';
import 'package:loyalty_program_app/data/repository/user_repository.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';
import 'package:loyalty_program_app/ui/screens/enter_screen.dart';
import 'package:loyalty_program_app/ui/widgets/inform_dialog_widget.dart';
import 'package:loyalty_program_app/utils/other_utils.dart';

part 'reg_form_event.dart';

part 'reg_form_state.dart';

/// блок для формы регистрации
class RegFormBloc extends Bloc<RegFormEvent, RegFormState> {
  final UserRepository _userRepository;
  final SettingRepository _settingRepository;

  RegFormBloc(
    this._userRepository,
    this._settingRepository,
  ) : super(RegFormInitial());

  @override
  Stream<RegFormState> mapEventToState(
    RegFormEvent event,
  ) async* {
    if (event is RegFormEventSubmitted) {
      yield RegFormSubmitting();

      try {
        /// сюда сохраним данные полей формы
        User user = User(
          email: event.fieldsState.fieldEmail,
          password: event.fieldsState.fieldPassword,
          firstName: event.fieldsState.fieldFirstName,
          lastName: event.fieldsState.fieldLastName,
          patronymic: event.fieldsState.fieldPatronymic,
          cardNumber: OtherUtils.getRandom(100000, 1000000),
        );

        /// записать в базу данных
        await _userRepository.addUser(user);

        /// ставим флаг об успешной регистрации - не первый запуск
        await _settingRepository.setIsFirstStart(false);

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
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<FieldsEnterCubit>(
              create: (_) => FieldsEnterCubit(),
            ),
            BlocProvider<EnterFormBloc>(
              create: (_) => EnterFormBloc(
                context.read<UserRepository>(),
                context.read<SettingRepository>(),
              ),
            ),
          ],
          child: EnterScreen(isVisibleButtonReg: false),
        ),
      ),
    );
  }
}
