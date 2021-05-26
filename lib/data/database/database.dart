import 'package:loyalty_program_app/data/database/tables.dart';
import 'package:loyalty_program_app/data/models/user.dart';
import 'package:loyalty_program_app/data/models/level.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'database.g.dart';

/// база данных sqlite
@UseMoor(
  tables: [TableUsers],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// проверить есть ли юзер в базе
  Future<List<DataUsers>> checkUser(String email) =>
      (select(tableUsers)..where((row) => row.email.equals(email))).get();

  /// добавить нового пользователя
  Future<void> addUser(User user) => into(tableUsers).insert(
        TableUsersCompanion(
          email: Value(user.email),
          password: Value(user.password),
          firstName: Value(user.firstName),
          lastName: Value(user.lastName),
          patronymic: Value(user.patronymic),
          cardNumber: Value(user.cardNumber),
          levelCode: Value(user.level),
        ),
      );

  /// редактировать пользователя
  Future<void> updateUser(User user) => update(tableUsers).replace(
        TableUsersCompanion(
          email: Value(user.email),
          password: Value(user.password),
          firstName: Value(user.firstName),
          lastName: Value(user.lastName),
          patronymic: Value(user.patronymic),
          cardNumber: Value(user.cardNumber),
          levelCode: Value(user.level),
        ),
      );

  /// авторизовать юзера
  Future<List<DataUsers>> authUser(String email, String password) =>
      (select(tableUsers)
            ..where((row) => row.email.equals(email))
            ..where((row) => row.password.equals(password)))
          .get();
}

/// открытие соединения и создание базы данных
LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      print(file);
      return VmDatabase(file);
    },
  );
}
