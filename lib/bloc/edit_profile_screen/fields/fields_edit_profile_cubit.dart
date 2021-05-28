import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/utils/field_validator_utils.dart';

part 'fields_edit_profile_state.dart';

/// кубит для изменения состояния полей формы редактирования профиля
class FieldsEditProfileCubit extends Cubit<FieldsEditProfileState> {
  final User user;

  FieldsEditProfileCubit(this.user)
      : super(FieldsEditProfileState(
          fieldFirstName: user.firstName,
          fieldLastName: user.lastName,
          fieldPatronymic: user.patronymic,
          fieldBirthdate:
              user.birthdate != null ? user.birthdate.toString() : null,
          fieldPhone: user.phone,
        ));

  void firstNameChanged(String? value) {
    emit(state.copyWith(fieldFirstName: value));
  }

  void lastNameChanged(String? value) {
    emit(state.copyWith(fieldLastName: value));
  }

  void patronymicChanged(String? value) {
    emit(state.copyWith(fieldPatronymic: value));
  }

  void birthdateChanged(String? value) {
    emit(state.copyWith(fieldBirthdate: value));
  }

  void phoneChanged(String? value) {
    emit(state.copyWith(fieldPhone: value));
  }
}
