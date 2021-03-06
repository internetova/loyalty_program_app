import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_program_app/bloc/settings_app/settings_app_cubit.dart';
import 'package:loyalty_program_app/data/models/level.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/mocks.dart';
import 'package:loyalty_program_app/ui/res/routes.dart';
import 'package:loyalty_program_app/ui/res/sizes.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';
import 'package:loyalty_program_app/ui/routes/about_program_route.dart';
import 'package:loyalty_program_app/ui/routes/edit_screen_route.dart';

/// экран профиля
class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _BuildAppBar(user: user),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _BuildHeader(user: user),
            _BuildUserInfo(user: user),
          ],
        ),
      ),
    );
  }
}

/// AppBar
class _BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final User user;

  const _BuildAppBar({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppStrings.titleScreenProfile),
      actions: [
        IconButton(
          onPressed: () {
            _edit(context);
          },
          icon: Icon(Icons.edit),
          color: Theme.of(context).primaryColor,
        ),
        IconButton(
          onPressed: () {
            _logout(context);
          },
          icon: Icon(Icons.logout),
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  /// редактировать профиль
  void _edit(BuildContext context) {
    EditScreenRoute.goEditProfileScreen(context, user);
  }

  /// выход из профиля
  void _logout(BuildContext context) {
    context.read<SettingsAppCubit>().logoutUser();

    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.enter, (route) => false);
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.appBarStandardHeader);
}


/// верхний блок с ФИО и названием ЛП
class _BuildHeader extends StatelessWidget {
  final User user;

  const _BuildHeader({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          user.firstName,
          style: Theme.of(context).textTheme.headline5,
        ),
        AppSizes.sizedBoxH4,
        Text(
          user.lastName,
          style: Theme.of(context).textTheme.headline5,
        ),
        GestureDetector(
          onTap: () {
            _onPressedAboutProgram(context, user);
          },
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Text(
              AppStrings.loyaltyName,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  /// тап по названию Программы
  void _onPressedAboutProgram(BuildContext context, User user) {
    AboutProgramRoute.goAboutProgramScreen(context, user);
  }
}

/// информация о пользователе
class _BuildUserInfo extends StatelessWidget {
  final User user;

  const _BuildUserInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _birthdate = user.birthdate != null
        ? DateFormat('dd.MM.yyyy').format(user.birthdate!).toString()
        : '-';

    final String _phone = user.phone != null ? user.phone! : '-';

    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.inputEmail,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          AppSizes.sizedBoxH4,
          Container(
            child: Text(user.email),
          ).cardProfile(context),
          AppSizes.sizedBoxH12,
          Text(
            AppStrings.inputBirthdate,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          AppSizes.sizedBoxH4,
          Container(
            child: Text(_birthdate),
          ).cardProfile(context),
          AppSizes.sizedBoxH12,
          Text(
            AppStrings.inputCardNumber,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          AppSizes.sizedBoxH4,
          Container(
            child: Text('${user.cardNumber}'),
          ).cardProfile(context),
          AppSizes.sizedBoxH12,
          Text(
            AppStrings.inputPhone,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          AppSizes.sizedBoxH4,
          Container(
            child: Text(_phone),
          ).cardProfile(context),
          AppSizes.sizedBoxH12,
          Text(
            AppStrings.inputLevel,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          AppSizes.sizedBoxH4,
          Container(
            child: _BuildDescriptionLevel(
              Mocks.levels.elementAt(user.level.index),
            ),
          ).cardProfile(context),
          AppSizes.sizedBoxH12,
        ],
      ),
    );
  }
}

/// расширение для контейнера с данными юзера
extension on Container {
  Widget cardProfile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: this,
    );
  }
}

/// описание уровня
class _BuildDescriptionLevel extends StatelessWidget {
  final Level level;

  const _BuildDescriptionLevel(
    this.level, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              level.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            AppSizes.sizedBoxH8,
            Text(
              level.description,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            AppSizes.sizedBoxH12,
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).accentColor.withOpacity(0.4),
              ),
              child: Text('${level.percent} %'),
            ),
          ],
        ),
      ],
    );
  }
}
