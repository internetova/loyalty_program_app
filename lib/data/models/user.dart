import 'package:equatable/equatable.dart';
import 'package:loyalty_program_app/data/models/level.dart';

/// параметры юзера
/// [cardNumber] предполагается, что при регистрации система автоматически
/// присвоет номер карты, я положу туда рандомное число
class User extends Equatable {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String patronymic;
  final String? phone;
  final DateTime? birthdate;
  final int cardNumber;
  final LevelCode level;

  User({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.patronymic,
    this.phone,
    this.birthdate,
    required this.cardNumber,
    this.level = LevelCode.first,
  });

  @override
  List<Object?> get props => [
        email,
        firstName,
        lastName,
        patronymic,
        phone,
        birthdate,
        cardNumber,
        level,
      ];
}
