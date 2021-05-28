part of 'settings_app_cubit.dart';

/// состояние настроек приложения
class SettingsAppState extends Equatable {
  final bool isFirstStart;
  final bool isAppNotReady;
  final bool isAuthUser;
  final String? authUserEmail;

  const SettingsAppState({
    this.isFirstStart = true,
    this.isAppNotReady = true,
    this.isAuthUser = false,
    this.authUserEmail,
  });

  SettingsAppState copyWith({
    bool? isFirstStart,
    bool? isAppNotReady,
    bool? isAuthUser,
    String? authUserEmail,
  }) {
    return SettingsAppState(
      isFirstStart: isFirstStart ?? this.isFirstStart,
      isAppNotReady: isAppNotReady ?? this.isAppNotReady,
      isAuthUser: isAuthUser ?? this.isAuthUser,
      authUserEmail: authUserEmail ?? this.authUserEmail,
    );
  }

  @override
  List<Object> get props => [
        isFirstStart,
        isAppNotReady,
        isAuthUser,
      ];
}
