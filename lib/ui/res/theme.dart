import 'package:flutter/material.dart';
import 'package:loyalty_program_app/ui/res/colors.dart';

/// тема
class AppTheme {
  AppTheme._();

  static ThemeData buildTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      brightness: Brightness.light,
      primaryColor: AppColors.lightColorLogo,
      primaryColorLight: Colors.orange.withOpacity(0.4),
      accentColor: Colors.green,
      appBarTheme: base.appBarTheme.copyWith(
        color: base.scaffoldBackgroundColor,
        textTheme: base.textTheme.copyWith(
          headline6: base.textTheme.headline6!.copyWith(
            color: AppColors.lightColorLogo,
            fontSize: 20,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      inputDecorationTheme: base.inputDecorationTheme.copyWith(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        errorStyle: TextStyle(fontSize: 12),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.orange.withOpacity(0.4),
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.orange.withOpacity(0.4),
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.lightColorLogo.withOpacity(0.4),
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.lightColorLogo.withOpacity(0.4),
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
      ),
      bottomSheetTheme: base.bottomSheetTheme.copyWith(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.lightColorLogo,
      ),
    );
  }
}
