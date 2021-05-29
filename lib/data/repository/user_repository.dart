import 'package:loyalty_program_app/data/database/database.dart';
import 'package:loyalty_program_app/data/local_storage/shared_pref_storage.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/ui/res/strings.dart';

/// репозиторий с данными пользователя
class UserRepository {
  final AppDatabase _database;
  final SharedPrefStorage _storage;

  UserRepository(this._database, this._storage);

  /// проверить есть ли юзер в базе
  Future<bool> checkUser(String email) async {
    final DataUsers? users = await _database.checkUser(email);

    if (users == null) {
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
  Future<void> updateUser(User newDataUser) =>
      _database.updateUser(newDataUser);

  /// авторизация пользователя
  /// если всё Ок вернём и сохраним в хранилище email и по нему уже будем
  /// получать данные из базы в кабинете
  Future<String> authUser(
      {required String email, required String password}) async {
    final DataUsers? isAuthUser = await _database.authUser(email, password);

    if (isAuthUser != null) {
      await _storage.setEmail(isAuthUser.email);
      return isAuthUser.email;
    } else {
      throw Exception(AppStrings.errorIncorrectField);
    }
  }

  /// получить данные юзера по email из базы
  Future<User> getUser(String email) async {
    final DataUsers? dataUser = await _database.getUser(email);

    if (dataUser != null) {
      return User(
        email: dataUser.email,
        firstName: dataUser.firstName,
        lastName: dataUser.lastName,
        patronymic: dataUser.patronymic,
        phone: dataUser.phone,
        birthdate: dataUser.birthdate,
        cardNumber: dataUser.cardNumber,
        level: dataUser.levelCode,
        password: dataUser.password,
      );
    } else {
      throw Exception(AppStrings.errorUserNull);
    }
  }
}
