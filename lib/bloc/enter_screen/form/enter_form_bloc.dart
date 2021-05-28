import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loyalty_program_app/bloc/enter_screen/fields/fields_enter_cubit.dart';
import 'package:loyalty_program_app/data/repository/setting_repository.dart';
import 'package:loyalty_program_app/data/repository/user_repository.dart';

part 'enter_form_event.dart';

part 'enter_form_state.dart';

/// блок для экрана входа
class EnterFormBloc extends Bloc<EnterFormEvent, EnterFormState> {
  final UserRepository _userRepository;
  final SettingRepository _settingRepository;

  EnterFormBloc(
    this._userRepository,
    this._settingRepository,
  ) : super(EnterFormInitial());

  @override
  Stream<EnterFormState> mapEventToState(
    EnterFormEvent event,
  ) async* {
    if (event is EnterFormEventSubmitted) {
      yield EnterFormSubmitting();

      try {
        final authUserEmail = await _userRepository.authUser(
          email: event.fieldsState.fieldEmail,
          password: event.fieldsState.fieldPassword,
        );

        await _settingRepository.setIsAuthUser(true);
        await _settingRepository.setEmail(authUserEmail);

        yield EnterFormSubmissionSuccess(authUserEmail);
      } catch (e) {
        print(e);
        yield EnterFormSubmissionFailed(e as Exception);
        rethrow;
      }
    }
  }
}
