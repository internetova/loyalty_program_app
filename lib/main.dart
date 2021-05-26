import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_program_app/bloc/enter_screen/fields/fields_enter_cubit.dart';
import 'package:loyalty_program_app/bloc/enter_screen/form/enter_form_bloc.dart';
import 'package:loyalty_program_app/bloc/registration_screen/fields/fields_reg_cubit.dart';
import 'package:loyalty_program_app/bloc/registration_screen/form/reg_form_bloc.dart';
import 'package:loyalty_program_app/data/database/database.dart';
import 'package:loyalty_program_app/data/repository/user_repository.dart';
import 'package:loyalty_program_app/mocks.dart';
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
        ProxyProvider<AppDatabase, UserRepository>(
          update: (_, db, userRepository) => UserRepository(db),
        )
      ],
      child: MaterialApp(
        title: AppStrings.appTitle,
        theme: _lightTheme,
        initialRoute: AppRoutes.splash,
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
                    ),
                  )
                ],
                child: EnterScreen(),
              ),
          AppRoutes.main: (context) => MainScreen(user: Mocks.user),
        },
      ),
    );
  }
}
