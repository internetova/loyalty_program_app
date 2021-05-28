import 'package:flutter/material.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/ui/screens/about_program_screen.dart';

/// маршрут на страницуО программе
class AboutProgramRoute {
  AboutProgramRoute._();

  static Future<Object?> goAboutProgramScreen(BuildContext context, User user) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AboutProgramScreen(user: user),
      ),
    );
  }
}