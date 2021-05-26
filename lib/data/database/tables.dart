// таблицы базы данных
import 'package:loyalty_program_app/data/models/level.dart';
import 'package:moor/moor.dart';

/// Пользователи
@DataClassName('DataUsers')
class TableUsers extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get email => text()();

  TextColumn get password => text()();

  TextColumn get firstName => text()();

  TextColumn get lastName => text()();

  TextColumn get patronymic => text()();

  TextColumn get phone => text().nullable()();

  DateTimeColumn get birthdate => dateTime().nullable()();

  IntColumn get cardNumber => integer()();

  IntColumn get levelCode => intEnum<LevelCode>()();
}