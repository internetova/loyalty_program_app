import 'package:flutter/material.dart';
import 'package:loyalty_program_app/data/models/level.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/mocks.dart';
import 'package:loyalty_program_app/ui/res/sizes.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';

/// экран с описанием программы
class AboutProgramScreen extends StatelessWidget {
  final User user;

  const AboutProgramScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.titleScreenAboutProgram),
        leading: BackButton(
            color: Theme.of(context).primaryColor,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _BuildHeader(),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: _BuildDescriptionProgram(
              user: user,
            ),
          ),
        ],
      ),
    );
  }
}

/// хеадер - заголовки
class _BuildHeader extends StatelessWidget {
  const _BuildHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppSizes.sizedBoxH40,
        Text(
          AppStrings.loyaltyName,
          style: Theme.of(context).textTheme.headline5,
        ),
        AppSizes.sizedBoxH16,
        Text(
          AppStrings.subtitleScreenAboutProgram,
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        AppSizes.sizedBoxH32,
      ],
    );
  }
}

/// описание уровней
class _BuildDescriptionProgram extends StatelessWidget {
  final User user;

  const _BuildDescriptionProgram({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: _ItemBuilder(
              user: user,
              level: Mocks.levels[index],
            ),
          );
        },
        childCount: Mocks.levels.length,
      ),
    );
  }
}

/// карточка описания уровня
class _ItemBuilder extends StatelessWidget {
  final Level level;
  final User user;

  const _ItemBuilder({
    Key? key,
    required this.level,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).accentColor.withOpacity(0.4),
                  ),
                  child: Text('${level.percent} %'),
                ),
              ],
            ),
          ),
          AppSizes.sizedBoxW8,
          user.level == level.levelCode
              ? Icon(
                  Icons.check_circle_rounded,
                  size: 30,
                  color: Theme.of(context).accentColor,
                )
              : AppSizes.sizedBox30,
        ],
      ),
    );
  }
}
