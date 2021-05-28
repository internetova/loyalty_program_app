import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/data/models/purchase.dart';
import 'package:loyalty_program_app/mocks.dart';
import 'package:loyalty_program_app/ui/res/sizes.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';
import 'package:loyalty_program_app/ui/routes/about_program_route.dart';

/// экран Кабинет
class CabinetScreen extends StatelessWidget {
  final User user;

  const CabinetScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.titleScreenCabinet),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _BuildActiveBonuses(activeBonuses: 500, user: user),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: _BuildUserPurchases(
              userPurchases: Mocks.mockUserPurchases,
            ),
          ),
        ],
      ),
    );
  }
}

/// блок активные бонусы с названием программы
class _BuildActiveBonuses extends StatelessWidget {
  final User user;
  final int activeBonuses;

  const _BuildActiveBonuses({
    Key? key,
    required this.activeBonuses,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              _onPressedAboutProgram(context, user);
            },
            child: Text(
              AppStrings.loyaltyName,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(AppStrings.loyaltyBonus),
              ),
              Text(
                '$activeBonuses',
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: Theme.of(context).accentColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// тап по названию Программы
  void _onPressedAboutProgram(BuildContext context, User user) {
    AboutProgramRoute.goAboutProgramScreen(context, user);
  }
}

/// блок покупки юзера
class _BuildUserPurchases extends StatelessWidget {
  final List<Purchase> userPurchases;

  const _BuildUserPurchases({
    Key? key,
    required this.userPurchases,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: _ItemBuilder(
              purchase: userPurchases[index],
            ),
          );
        },
        childCount: userPurchases.length,
      ),
    );
  }
}

/// информация о транзакции
class _ItemBuilder extends StatelessWidget {
  final Purchase purchase;

  const _ItemBuilder({
    Key? key,
    required this.purchase,
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
                  purchase.name,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                AppSizes.sizedBoxH8,
                Text(
                  '${DateFormat('dd.MM.yyyy').format(purchase.date)}',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Theme.of(context).shadowColor.withOpacity(0.3),
                      ),
                ),
              ],
            ),
          ),
          AppSizes.sizedBoxW8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${NumberFormat.currency(locale: 'ru', symbol: '₽').format(purchase.cost)}',
                // '${purchase.cost}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              AppSizes.sizedBoxH8,
              _BuildBonus(purchase: purchase),
            ],
          ),
        ],
      ),
    );
  }
}

/// дата и бонус
class _BuildBonus extends StatelessWidget {
  final Purchase purchase;

  const _BuildBonus({
    Key? key,
    required this.purchase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final String _plusMinus;
    late final Color _bgColor;

    if (purchase.bonus > 0) {
      _plusMinus = '+';
      _bgColor = Theme.of(context).accentColor.withOpacity(0.4);
    } else {
      _plusMinus = '';
      _bgColor = Theme.of(context).primaryColor.withOpacity(0.4);
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _bgColor,
      ),
      child: Text('$_plusMinus${purchase.bonus}'),
    );
  }
}
