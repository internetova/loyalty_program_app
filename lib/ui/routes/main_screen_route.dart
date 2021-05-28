import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_program_app/bloc/main_screen/pages/main_pages_cubit.dart';
import 'package:loyalty_program_app/bloc/main_screen/main_screen_bloc.dart';
import 'package:loyalty_program_app/data/repository/user_repository.dart';
import 'package:loyalty_program_app/ui/screens/main_screen.dart';

/// навигатор для перехода на MainScreen
class MainScreenRoute {
  MainScreenRoute._();

  static Future<Object?> goMainScreen(
      BuildContext context, String authUserEmail) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider<MainScreenBloc>(
              create: (_) => MainScreenBloc(
                context.read<UserRepository>(),
              )..add(UserRequested(authUserEmail)),
            ),
            BlocProvider<MainPagesCubit>(
              create: (_) => MainPagesCubit(),
            )
          ],
          child: MainScreen(),
        ),
      ),
    );
  }
}
