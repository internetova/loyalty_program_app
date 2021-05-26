import 'package:flutter/material.dart';
import 'package:loyalty_program_app/ui/res/routes.dart';
import 'package:loyalty_program_app/ui/res/sizes.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';

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
    Navigator.of(context).pushReplacementNamed(AppRoutes.enter);
  }
}
