import 'package:loyalty_program_app/data/database/database.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';

/// репозиторий с данными пользователя
class UserRepository {
  final AppDatabase _database;

  UserRepository(this._database);

  /// проверить есть ли юзер в базе
  Future<bool> checkUser(String email) async {
    final List<DataUsers> users = await _database.checkUser(email);

    if (users.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  /// добавить нового пользователя
  Future<void> addUser(User user) async {
    final bool isExists = await checkUser(user.email);

    if (isExists) {
      throw Exception(AppStrings.errorUserExists);
    } else {
      _database.addUser(user);
    }
  }

  /// редактировать пользователя
  Future<void> updateUser(User user, User newDataUser) async {
    _database.updateUser(
      User(
        id: user.id,
        email: user.email,
        password: user.password,
        firstName: newDataUser.firstName,
        lastName: newDataUser.lastName,
        patronymic: newDataUser.patronymic,
        phone: newDataUser.phone,
        birthdate: newDataUser.birthdate,
        cardNumber: user.cardNumber,
        level: user.level,
      ),
    );
  }

  /// авторизация пользователя
  Future<bool> authUser({required String email, required String password}) async {
    final List<DataUsers> isAuth =
        await _database.authUser(email, password);

    if (isAuth.isNotEmpty) {
      return true;
    } else {
      throw Exception(AppStrings.errorIncorrectField);
    }
  }
}
