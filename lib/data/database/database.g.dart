// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DataUsers extends DataClass implements Insertable<DataUsers> {
  final int id;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String patronymic;
  final String? phone;
  final DateTime? birthdate;
  final int cardNumber;
  final LevelCode levelCode;
  DataUsers(
      {required this.id,
      required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.patronymic,
      this.phone,
      this.birthdate,
      required this.cardNumber,
      required this.levelCode});
  factory DataUsers.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DataUsers(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password'])!,
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name'])!,
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name'])!,
      patronymic: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}patronymic'])!,
      phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      birthdate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}birthdate']),
      cardNumber: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}card_number'])!,
      levelCode: $TableUsersTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}level_code']))!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['patronymic'] = Variable<String>(patronymic);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String?>(phone);
    }
    if (!nullToAbsent || birthdate != null) {
      map['birthdate'] = Variable<DateTime?>(birthdate);
    }
    map['card_number'] = Variable<int>(cardNumber);
    {
      final converter = $TableUsersTable.$converter0;
      map['level_code'] = Variable<int>(converter.mapToSql(levelCode)!);
    }
    return map;
  }

  TableUsersCompanion toCompanion(bool nullToAbsent) {
    return TableUsersCompanion(
      id: Value(id),
      email: Value(email),
      password: Value(password),
      firstName: Value(firstName),
      lastName: Value(lastName),
      patronymic: Value(patronymic),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      birthdate: birthdate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthdate),
      cardNumber: Value(cardNumber),
      levelCode: Value(levelCode),
    );
  }

  factory DataUsers.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DataUsers(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      patronymic: serializer.fromJson<String>(json['patronymic']),
      phone: serializer.fromJson<String?>(json['phone']),
      birthdate: serializer.fromJson<DateTime?>(json['birthdate']),
      cardNumber: serializer.fromJson<int>(json['cardNumber']),
      levelCode: serializer.fromJson<LevelCode>(json['levelCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'patronymic': serializer.toJson<String>(patronymic),
      'phone': serializer.toJson<String?>(phone),
      'birthdate': serializer.toJson<DateTime?>(birthdate),
      'cardNumber': serializer.toJson<int>(cardNumber),
      'levelCode': serializer.toJson<LevelCode>(levelCode),
    };
  }

  DataUsers copyWith(
          {int? id,
          String? email,
          String? password,
          String? firstName,
          String? lastName,
          String? patronymic,
          String? phone,
          DateTime? birthdate,
          int? cardNumber,
          LevelCode? levelCode}) =>
      DataUsers(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        patronymic: patronymic ?? this.patronymic,
        phone: phone ?? this.phone,
        birthdate: birthdate ?? this.birthdate,
        cardNumber: cardNumber ?? this.cardNumber,
        levelCode: levelCode ?? this.levelCode,
      );
  @override
  String toString() {
    return (StringBuffer('DataUsers(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('patronymic: $patronymic, ')
          ..write('phone: $phone, ')
          ..write('birthdate: $birthdate, ')
          ..write('cardNumber: $cardNumber, ')
          ..write('levelCode: $levelCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          email.hashCode,
          $mrjc(
              password.hashCode,
              $mrjc(
                  firstName.hashCode,
                  $mrjc(
                      lastName.hashCode,
                      $mrjc(
                          patronymic.hashCode,
                          $mrjc(
                              phone.hashCode,
                              $mrjc(
                                  birthdate.hashCode,
                                  $mrjc(cardNumber.hashCode,
                                      levelCode.hashCode))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DataUsers &&
          other.id == this.id &&
          other.email == this.email &&
          other.password == this.password &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.patronymic == this.patronymic &&
          other.phone == this.phone &&
          other.birthdate == this.birthdate &&
          other.cardNumber == this.cardNumber &&
          other.levelCode == this.levelCode);
}

class TableUsersCompanion extends UpdateCompanion<DataUsers> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> password;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> patronymic;
  final Value<String?> phone;
  final Value<DateTime?> birthdate;
  final Value<int> cardNumber;
  final Value<LevelCode> levelCode;
  const TableUsersCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.patronymic = const Value.absent(),
    this.phone = const Value.absent(),
    this.birthdate = const Value.absent(),
    this.cardNumber = const Value.absent(),
    this.levelCode = const Value.absent(),
  });
  TableUsersCompanion.insert({
    this.id = const Value.absent(),
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String patronymic,
    this.phone = const Value.absent(),
    this.birthdate = const Value.absent(),
    required int cardNumber,
    required LevelCode levelCode,
  })  : email = Value(email),
        password = Value(password),
        firstName = Value(firstName),
        lastName = Value(lastName),
        patronymic = Value(patronymic),
        cardNumber = Value(cardNumber),
        levelCode = Value(levelCode);
  static Insertable<DataUsers> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? password,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? patronymic,
    Expression<String?>? phone,
    Expression<DateTime?>? birthdate,
    Expression<int>? cardNumber,
    Expression<LevelCode>? levelCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (patronymic != null) 'patronymic': patronymic,
      if (phone != null) 'phone': phone,
      if (birthdate != null) 'birthdate': birthdate,
      if (cardNumber != null) 'card_number': cardNumber,
      if (levelCode != null) 'level_code': levelCode,
    });
  }

  TableUsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? email,
      Value<String>? password,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? patronymic,
      Value<String?>? phone,
      Value<DateTime?>? birthdate,
      Value<int>? cardNumber,
      Value<LevelCode>? levelCode}) {
    return TableUsersCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      patronymic: patronymic ?? this.patronymic,
      phone: phone ?? this.phone,
      birthdate: birthdate ?? this.birthdate,
      cardNumber: cardNumber ?? this.cardNumber,
      levelCode: levelCode ?? this.levelCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (patronymic.present) {
      map['patronymic'] = Variable<String>(patronymic.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String?>(phone.value);
    }
    if (birthdate.present) {
      map['birthdate'] = Variable<DateTime?>(birthdate.value);
    }
    if (cardNumber.present) {
      map['card_number'] = Variable<int>(cardNumber.value);
    }
    if (levelCode.present) {
      final converter = $TableUsersTable.$converter0;
      map['level_code'] = Variable<int>(converter.mapToSql(levelCode.value)!);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableUsersCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('patronymic: $patronymic, ')
          ..write('phone: $phone, ')
          ..write('birthdate: $birthdate, ')
          ..write('cardNumber: $cardNumber, ')
          ..write('levelCode: $levelCode')
          ..write(')'))
        .toString();
  }
}

class $TableUsersTable extends TableUsers
    with TableInfo<$TableUsersTable, DataUsers> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TableUsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedTextColumn email = _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedTextColumn password = _constructPassword();
  GeneratedTextColumn _constructPassword() {
    return GeneratedTextColumn(
      'password',
      $tableName,
      false,
    );
  }

  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedTextColumn firstName = _constructFirstName();
  GeneratedTextColumn _constructFirstName() {
    return GeneratedTextColumn(
      'first_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedTextColumn lastName = _constructLastName();
  GeneratedTextColumn _constructLastName() {
    return GeneratedTextColumn(
      'last_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _patronymicMeta = const VerificationMeta('patronymic');
  @override
  late final GeneratedTextColumn patronymic = _constructPatronymic();
  GeneratedTextColumn _constructPatronymic() {
    return GeneratedTextColumn(
      'patronymic',
      $tableName,
      false,
    );
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedTextColumn phone = _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn(
      'phone',
      $tableName,
      true,
    );
  }

  final VerificationMeta _birthdateMeta = const VerificationMeta('birthdate');
  @override
  late final GeneratedDateTimeColumn birthdate = _constructBirthdate();
  GeneratedDateTimeColumn _constructBirthdate() {
    return GeneratedDateTimeColumn(
      'birthdate',
      $tableName,
      true,
    );
  }

  final VerificationMeta _cardNumberMeta = const VerificationMeta('cardNumber');
  @override
  late final GeneratedIntColumn cardNumber = _constructCardNumber();
  GeneratedIntColumn _constructCardNumber() {
    return GeneratedIntColumn(
      'card_number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _levelCodeMeta = const VerificationMeta('levelCode');
  @override
  late final GeneratedIntColumn levelCode = _constructLevelCode();
  GeneratedIntColumn _constructLevelCode() {
    return GeneratedIntColumn(
      'level_code',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        email,
        password,
        firstName,
        lastName,
        patronymic,
        phone,
        birthdate,
        cardNumber,
        levelCode
      ];
  @override
  $TableUsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'table_users';
  @override
  final String actualTableName = 'table_users';
  @override
  VerificationContext validateIntegrity(Insertable<DataUsers> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('patronymic')) {
      context.handle(
          _patronymicMeta,
          patronymic.isAcceptableOrUnknown(
              data['patronymic']!, _patronymicMeta));
    } else if (isInserting) {
      context.missing(_patronymicMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('birthdate')) {
      context.handle(_birthdateMeta,
          birthdate.isAcceptableOrUnknown(data['birthdate']!, _birthdateMeta));
    }
    if (data.containsKey('card_number')) {
      context.handle(
          _cardNumberMeta,
          cardNumber.isAcceptableOrUnknown(
              data['card_number']!, _cardNumberMeta));
    } else if (isInserting) {
      context.missing(_cardNumberMeta);
    }
    context.handle(_levelCodeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DataUsers map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DataUsers.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TableUsersTable createAlias(String alias) {
    return $TableUsersTable(_db, alias);
  }

  static TypeConverter<LevelCode, int> $converter0 =
      const EnumIndexConverter<LevelCode>(LevelCode.values);
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TableUsersTable tableUsers = $TableUsersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tableUsers];
}
