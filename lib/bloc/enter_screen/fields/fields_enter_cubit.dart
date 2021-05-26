import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loyalty_program_app/utils/field_validator_utils.dart';

part 'fields_enter_state.dart';

/// кубит для полей формы входа
class FieldsEnterCubit extends Cubit<FieldsEnterState> {
  FieldsEnterCubit() : super(FieldsEnterState());

  void emailChanged(String? value) {
    emit(state.copyWith(fieldEmail: value));
  }

  void passwordChanged(String? value) {
    emit(state.copyWith(fieldPassword: value));
  }
}
