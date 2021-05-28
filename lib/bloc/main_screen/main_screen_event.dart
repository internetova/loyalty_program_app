part of 'main_screen_bloc.dart';

/// события экрана [MainScreen]
abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent();
}

/// запрошены данные юзера
class UserRequested extends MainScreenEvent {
  final String email;

  UserRequested(this.email);

  @override
  List<Object?> get props => [email];
}
