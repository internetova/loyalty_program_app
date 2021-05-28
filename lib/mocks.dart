import 'package:loyalty_program_app/data/models/level.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/data/models/purchase.dart';

/// моковые данные для вёрстки
class Mocks {
  /// данные юзера
  static final user = User(
    firstName: 'Иван',
    lastName: 'Петров',
    patronymic: 'Сергеевич',
    email: 'ivanov@yandex.ru',
    password: '12345678',
    phone: '+79257411212',
    birthdate: DateTime.now(),
    cardNumber: 123456,
    level: LevelCode.first,
  );

  /// покупки юзера
  static final List<Purchase> mockUserPurchases = [
    Purchase(
      name: 'Название покупки 1',
      cost: 200.00,
      bonus: 4,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 2',
      cost: 1084.22,
      bonus: 22,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 3',
      cost: 730.00,
      bonus: -150,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 4',
      cost: 522.30,
      bonus: 10,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 5',
      cost: 888.00,
      bonus: 18,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 6',
      cost: 2346.00,
      bonus: 47,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 7',
      cost: 100.00,
      bonus: 2,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 8',
      cost: 255.00,
      bonus: 5,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 9',
      cost: 653.76,
      bonus: 13,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 10',
      cost: 4007.00,
      bonus: 80,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 11',
      cost: 1300.00,
      bonus: 26,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 12',
      cost: 774.12,
      bonus: 15,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 13',
      cost: 2400.00,
      bonus: 48,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 14',
      cost: 972.00,
      bonus: 19,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 15',
      cost: 44.00,
      bonus: 1,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 16',
      cost: 422.89,
      bonus: 8,
      date: DateTime.now(),
    ),
    Purchase(
      name: 'Название покупки 17',
      cost: 610.00,
      bonus: 12,
      date: DateTime.now(),
    ),
  ];

  /// описание уровней программы
  static final List<Level> levels = [
    Level(
      title: 'Первый уровень',
      description: 'Сумма всех покупок до 40 000 рублей',
      levelCode: LevelCode.first,
      percent: 2,
    ),
    Level(
      title: 'Второй уровень',
      description: 'Сумма всех покупок от 40 000 до 80 000 рублей',
      levelCode: LevelCode.second,
      percent: 3,
    ),
    Level(
      title: 'Третий уровень',
      description: 'Сумма всех покупок от 80 000',
      levelCode: LevelCode.third,
      percent: 4,
    ),
  ];
}
