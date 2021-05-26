import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loyalty_program_app/utils/utils_field_validator.dart';

part 'fields_reg_state.dart';

/// кубит для изменения состояния полей формы регистрации
class FieldsRegCubit extends Cubit<FieldsRegState> {
  FieldsRegCubit() : super(FieldsRegState());

  void emailChanged(String? value) {
    emit(state.copyWith(fieldEmail: value));
  }

  void firstNameChanged(String? value) {
    emit(state.copyWith(fieldFirstName: value));
  }

  void lastNameChanged(String? value) {
    emit(state.copyWith(fieldLastName: value));
  }

  void patronymicChanged(String? value) {
    emit(state.copyWith(fieldPatronymic: value));
  }

  void passwordChanged(String? value) {
    emit(state.copyWith(fieldPassword: value));
  }

  void confirmPasswordChanged(String? value) {
    emit(state.copyWith(fieldConfirmPassword: value));
  }
}
