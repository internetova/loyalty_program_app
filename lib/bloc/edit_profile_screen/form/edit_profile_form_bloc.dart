import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:loyalty_program_app/bloc/edit_profile_screen/fields/fields_edit_profile_cubit.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/data/repository/user_repository.dart';

part 'edit_profile_form_event.dart';

part 'edit_profile_form_state.dart';

/// блок для сохранения формы регистрации данных юзера
class EditProfileFormBloc
    extends Bloc<EditProfileFormEvent, EditProfileFormState> {
  final User user;
  final UserRepository _userRepository;

  EditProfileFormBloc(this.user, this._userRepository)
      : super(EditProfileFormInitial());

  @override
  Stream<EditProfileFormState> mapEventToState(
    EditProfileFormEvent event,
  ) async* {
    if (event is EditProfileFormEventSubmitted) {
      yield EditProfileFormSubmitting();

      try {
        /// преобразуем дату из строки в дату
        DateTime? _birthdate;

        if (event.fieldsState.fieldBirthdate != null &&
            event.fieldsState.fieldBirthdate != '') {
          if (event.fieldsState.fieldBirthdate?.length == 10) {
            _birthdate = DateFormat('dd.MM.yyyy')
                .parse((event.fieldsState.fieldBirthdate!));
          } else {
            _birthdate = DateFormat('yyyy-MM-dd')
                .parse((event.fieldsState.fieldBirthdate!));
          }
        }

        /// сюда сохраним данные полей формы
        User newDataUser = User(
          firstName: event.fieldsState.fieldFirstName,
          lastName: event.fieldsState.fieldLastName,
          patronymic: event.fieldsState.fieldPatronymic,
          birthdate: _birthdate,
          phone: event.fieldsState.fieldPhone,
          email: user.email,
          password: user.password,
          cardNumber: user.cardNumber,
        );

        /// записать в базу данных
        await _userRepository.updateUser(newDataUser);

        yield EditProfileFormSubmissionSuccess();
      } catch (e) {
        yield EditProfileFormSubmissionFailed(e as Exception);
        rethrow;
      }
    }
  }
}
