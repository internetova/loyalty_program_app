import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/ui/components/text_button_form.dart';
import 'package:loyalty_program_app/ui/res/sizes.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';
import 'package:loyalty_program_app/ui/screens/about_program_screen.dart';

/// экран профиля
class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.titleScreenProfile),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _BuildHeader(user: user),
                _BuildUserInfo(user: user),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButtonForm(
                  isButtonEnabled: true,
                  onPressed: () {},
                  title: AppStrings.buttonEdit,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
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
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AboutProgramScreen(user: user)));
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
        : '';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
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
            child: Text('${user.phone}'),
          ).cardProfile(context),
          AppSizes.sizedBoxH12,
          Text(
            AppStrings.inputLevel,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          AppSizes.sizedBoxH4,
          Container(
            child: Text('${user.level}'),
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
