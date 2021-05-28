import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_program_app/bloc/enter_screen/fields/fields_enter_cubit.dart';
import 'package:loyalty_program_app/bloc/enter_screen/form/enter_form_bloc.dart';
import 'package:loyalty_program_app/bloc/main_screen/pages/main_pages_cubit.dart';
import 'package:loyalty_program_app/bloc/main_screen/main_screen_bloc.dart';
import 'package:loyalty_program_app/bloc/registration_screen/fields/fields_reg_cubit.dart';
import 'package:loyalty_program_app/bloc/registration_screen/form/reg_form_bloc.dart';
import 'package:loyalty_program_app/bloc/settings_app/settings_app_cubit.dart';
import 'package:loyalty_program_app/data/database/database.dart';
import 'package:loyalty_program_app/data/local_storage/shared_pref_storage.dart';
import 'package:loyalty_program_app/data/repository/setting_repository.dart';
import 'package:loyalty_program_app/data/repository/user_repository.dart';
import 'package:loyalty_program_app/ui/res/routes.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';
import 'package:loyalty_program_app/ui/res/theme.dart';
import 'package:loyalty_program_app/ui/screens/enter_screen.dart';
import 'package:loyalty_program_app/ui/screens/main_screen.dart';
import 'package:loyalty_program_app/ui/screens/registration_screen.dart';
import 'package:loyalty_program_app/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

final ThemeData _lightTheme = AppTheme.buildTheme();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppDatabase>(
          create: (_) => AppDatabase(),
          dispose: (context, db) => db.close(),
        ),
        Provider<SharedPrefStorage>(
          create: (_) => SharedPrefStorage(),
        ),
        ProxyProvider<SharedPrefStorage, SettingRepository>(
          update: (_, storage, userRepository) => SettingRepository(storage),
        ),
        ProxyProvider2<AppDatabase, SharedPrefStorage, UserRepository>(
          update: (_, db, storage, userRepository) =>
              UserRepository(db, storage),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SettingsAppCubit>(
            create: (context) => SettingsAppCubit(
              context.read<SettingRepository>(),
            )..initState(),
          ),
        ],
        child: BlocBuilder<SettingsAppCubit, SettingsAppState>(
          builder: (context, state) {
            return MaterialApp(
              title: AppStrings.appTitle,
              theme: _lightTheme,
              debugShowCheckedModeBanner: false,
              initialRoute: state.isAppNotReady
                  ? AppRoutes.splash
                  : state.isAuthUser && state.authUserEmail != null
                      ? AppRoutes.main
                      : state.isFirstStart
                          ? AppRoutes.registration
                          : AppRoutes.enter,
              routes: {
                AppRoutes.splash: (context) => SplashScreen(),
                AppRoutes.registration: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider<FieldsRegCubit>(
                          create: (_) => FieldsRegCubit(),
                        ),
                        BlocProvider<RegFormBloc>(
                          create: (_) => RegFormBloc(
                            context.read<UserRepository>(),
                            context.read<SettingRepository>(),
                          ),
                        ),
                      ],
                      child: RegistrationScreen(),
                    ),
                AppRoutes.enter: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider<FieldsEnterCubit>(
                          create: (_) => FieldsEnterCubit(),
                        ),
                        BlocProvider<EnterFormBloc>(
                          create: (_) => EnterFormBloc(
                            context.read<UserRepository>(),
                            context.read<SettingRepository>(),
                          ),
                        ),
                      ],
                      child: EnterScreen(),
                    ),
                AppRoutes.main: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider<MainScreenBloc>(
                          create: (_) => MainScreenBloc(
                            context.read<UserRepository>(),
                          )..add(UserRequested(state.authUserEmail!)),
                        ),
                        BlocProvider<MainPagesCubit>(
                          create: (_) => MainPagesCubit(),
                        ),
                      ],
                      child: MainScreen(),
                    ),
              },
            );
          },
        ),
      ),
    );
  }
}
