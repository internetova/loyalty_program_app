import 'package:flutter/material.dart';
import 'package:loyalty_program_app/bloc/settings_app/settings_app_cubit.dart';
import 'package:loyalty_program_app/ui/res/routes.dart';
import 'package:loyalty_program_app/ui/res/sizes.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_program_app/ui/routes/main_screen_route.dart';

/// стартовый экран, инициализация приложения
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToNext();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(AppStrings.splashTextHeader),
        ),
      ),
    );
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(AppSizes.seconds1);

    /// первый старт
    if (context.read<SettingsAppCubit>().state.isFirstStart) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.registration);

      /// если юзер авторизован
    } else if (context.read<SettingsAppCubit>().state.isAuthUser &&
        context.read<SettingsAppCubit>().state.authUserEmail != null) {
      final String authUserEmail =
          context.read<SettingsAppCubit>().state.authUserEmail!;

      MainScreenRoute.goMainScreen(
        context,
        authUserEmail: authUserEmail,
        pageIndex: 0,
      );

      /// если зарегистрирован - не первый запуск приложения
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.enter);
    }
  }
}
