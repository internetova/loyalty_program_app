import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loyalty_program_app/bloc/enter_screen/fields/fields_enter_cubit.dart';
import 'package:loyalty_program_app/data/repository/user_repository.dart';

part 'enter_form_event.dart';

part 'enter_form_state.dart';

/// блок для экрана входа
class EnterFormBloc extends Bloc<EnterFormEvent, EnterFormState> {
  final UserRepository _userRepository;

  EnterFormBloc(this._userRepository) : super(EnterFormInitial());

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

        yield EnterFormSubmissionSuccess(authUserEmail);
      } catch (e) {
        print(e);
        yield EnterFormSubmissionFailed(e as Exception);
        rethrow;
      }
    }
  }
}
