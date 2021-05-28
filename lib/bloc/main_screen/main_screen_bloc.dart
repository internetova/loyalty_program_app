import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/data/repository/user_repository.dart';

part 'main_screen_event.dart';

part 'main_screen_state.dart';

/// блок экрана [MainScreen]
class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final UserRepository _userRepository;

  MainScreenBloc(this._userRepository) : super(MainScreenInitial());

  @override
  Stream<MainScreenState> mapEventToState(
    MainScreenEvent event,
  ) async* {
    if (event is UserRequested) {
      yield* _userRequested(event);
    }
  }

  /// запрошены данные пользователя
  Stream<MainScreenState> _userRequested(UserRequested event) async* {
    yield MainScreenUserLoading();

    try {
      final User authUser = await _userRepository.getUser(event.email);

      yield MainScreenUserLoadSuccess(authUser);
    } catch (e) {
      yield MainScreenUserLoadFailure(e as Exception);
      rethrow;
    }
  }
}
