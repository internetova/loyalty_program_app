part of 'main_screen_bloc.dart';

/// состояние экрана [MainScreen]
abstract class MainScreenState extends Equatable {
  const MainScreenState();
}

/// инициализация
class MainScreenInitial extends MainScreenState {
  @override
  List<Object> get props => [];
}

/// данные юзера загружаются
class MainScreenUserLoading extends MainScreenState {
  @override
  List<Object> get props => [];
}

/// данные юзера загружены
class MainScreenUserLoadSuccess extends MainScreenState {
  final User user;

  MainScreenUserLoadSuccess(this.user);

  @override
  List<Object> get props => [user];
}

/// состояние ошибки
class MainScreenUserLoadFailure extends MainScreenState {
  final Exception exception;

  MainScreenUserLoadFailure(this.exception);

  @override
  List<Object?> get props => [exception];
}
