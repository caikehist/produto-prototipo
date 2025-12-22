// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'UNIQUE',
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, username, password, role];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String username;
  final String password;
  final String role;
  const User({
    required this.id,
    required this.username,
    required this.password,
    required this.role,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['role'] = Variable<String>(role);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      username: Value(username),
      password: Value(password),
      role: Value(role),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      role: serializer.fromJson<String>(json['role']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'role': serializer.toJson<String>(role),
    };
  }

  User copyWith({int? id, String? username, String? password, String? role}) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        role: role ?? this.role,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
      role: data.role.present ? data.role.value : this.role,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, password, role);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.username == this.username &&
          other.password == this.password &&
          other.role == this.role);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> password;
  final Value<String> role;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.role = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String password,
    required String role,
  }) : username = Value(username),
       password = Value(password),
       role = Value(role);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? role,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (role != null) 'role': role,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? username,
    Value<String>? password,
    Value<String>? role,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }
}

class $MissionsTable extends Missions with TableInfo<$MissionsTable, Mission> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MissionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('PENDENTE'),
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<int> createdBy = GeneratedColumn<int>(
    'created_by',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    startDate,
    endDate,
    status,
    createdBy,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'missions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Mission> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    } else if (isInserting) {
      context.missing(_createdByMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Mission map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Mission(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_by'],
      )!,
    );
  }

  @override
  $MissionsTable createAlias(String alias) {
    return $MissionsTable(attachedDatabase, alias);
  }
}

class Mission extends DataClass implements Insertable<Mission> {
  final int id;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String status;
  final int createdBy;
  const Mission({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.createdBy,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['status'] = Variable<String>(status);
    map['created_by'] = Variable<int>(createdBy);
    return map;
  }

  MissionsCompanion toCompanion(bool nullToAbsent) {
    return MissionsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      startDate: Value(startDate),
      endDate: Value(endDate),
      status: Value(status),
      createdBy: Value(createdBy),
    );
  }

  factory Mission.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Mission(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      status: serializer.fromJson<String>(json['status']),
      createdBy: serializer.fromJson<int>(json['createdBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'status': serializer.toJson<String>(status),
      'createdBy': serializer.toJson<int>(createdBy),
    };
  }

  Mission copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
    int? createdBy,
  }) => Mission(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    status: status ?? this.status,
    createdBy: createdBy ?? this.createdBy,
  );
  Mission copyWithCompanion(MissionsCompanion data) {
    return Mission(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      status: data.status.present ? data.status.value : this.status,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Mission(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('createdBy: $createdBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    startDate,
    endDate,
    status,
    createdBy,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Mission &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.status == this.status &&
          other.createdBy == this.createdBy);
}

class MissionsCompanion extends UpdateCompanion<Mission> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<String> status;
  final Value<int> createdBy;
  const MissionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.status = const Value.absent(),
    this.createdBy = const Value.absent(),
  });
  MissionsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    this.status = const Value.absent(),
    required int createdBy,
  }) : title = Value(title),
       description = Value(description),
       startDate = Value(startDate),
       endDate = Value(endDate),
       createdBy = Value(createdBy);
  static Insertable<Mission> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? status,
    Expression<int>? createdBy,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (status != null) 'status': status,
      if (createdBy != null) 'created_by': createdBy,
    });
  }

  MissionsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? description,
    Value<DateTime>? startDate,
    Value<DateTime>? endDate,
    Value<String>? status,
    Value<int>? createdBy,
  }) {
    return MissionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<int>(createdBy.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MissionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('createdBy: $createdBy')
          ..write(')'))
        .toString();
  }
}

class $ArtifactsTable extends Artifacts
    with TableInfo<$ArtifactsTable, Artifact> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArtifactsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _missionIdMeta = const VerificationMeta(
    'missionId',
  );
  @override
  late final GeneratedColumn<int> missionId = GeneratedColumn<int>(
    'mission_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES missions (id)',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _registeredByMeta = const VerificationMeta(
    'registeredBy',
  );
  @override
  late final GeneratedColumn<String> registeredBy = GeneratedColumn<String>(
    'registered_by',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _registrationDateMeta = const VerificationMeta(
    'registrationDate',
  );
  @override
  late final GeneratedColumn<DateTime> registrationDate =
      GeneratedColumn<DateTime>(
        'registration_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _originalDateMeta = const VerificationMeta(
    'originalDate',
  );
  @override
  late final GeneratedColumn<DateTime> originalDate = GeneratedColumn<DateTime>(
    'original_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _observationsMeta = const VerificationMeta(
    'observations',
  );
  @override
  late final GeneratedColumn<String> observations = GeneratedColumn<String>(
    'observations',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    missionId,
    userId,
    type,
    filePath,
    title,
    description,
    registeredBy,
    registrationDate,
    originalDate,
    observations,
    latitude,
    longitude,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'artifacts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Artifact> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('mission_id')) {
      context.handle(
        _missionIdMeta,
        missionId.isAcceptableOrUnknown(data['mission_id']!, _missionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_missionIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('registered_by')) {
      context.handle(
        _registeredByMeta,
        registeredBy.isAcceptableOrUnknown(
          data['registered_by']!,
          _registeredByMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_registeredByMeta);
    }
    if (data.containsKey('registration_date')) {
      context.handle(
        _registrationDateMeta,
        registrationDate.isAcceptableOrUnknown(
          data['registration_date']!,
          _registrationDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_registrationDateMeta);
    }
    if (data.containsKey('original_date')) {
      context.handle(
        _originalDateMeta,
        originalDate.isAcceptableOrUnknown(
          data['original_date']!,
          _originalDateMeta,
        ),
      );
    }
    if (data.containsKey('observations')) {
      context.handle(
        _observationsMeta,
        observations.isAcceptableOrUnknown(
          data['observations']!,
          _observationsMeta,
        ),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Artifact map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Artifact(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      missionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mission_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      registeredBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}registered_by'],
      )!,
      registrationDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}registration_date'],
      )!,
      originalDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}original_date'],
      ),
      observations: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}observations'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ArtifactsTable createAlias(String alias) {
    return $ArtifactsTable(attachedDatabase, alias);
  }
}

class Artifact extends DataClass implements Insertable<Artifact> {
  final int id;
  final int missionId;
  final int userId;
  final String type;
  final String filePath;
  final String title;
  final String? description;
  final String registeredBy;
  final DateTime registrationDate;
  final DateTime? originalDate;
  final String? observations;
  final double? latitude;
  final double? longitude;
  final DateTime createdAt;
  const Artifact({
    required this.id,
    required this.missionId,
    required this.userId,
    required this.type,
    required this.filePath,
    required this.title,
    this.description,
    required this.registeredBy,
    required this.registrationDate,
    this.originalDate,
    this.observations,
    this.latitude,
    this.longitude,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['mission_id'] = Variable<int>(missionId);
    map['user_id'] = Variable<int>(userId);
    map['type'] = Variable<String>(type);
    map['file_path'] = Variable<String>(filePath);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['registered_by'] = Variable<String>(registeredBy);
    map['registration_date'] = Variable<DateTime>(registrationDate);
    if (!nullToAbsent || originalDate != null) {
      map['original_date'] = Variable<DateTime>(originalDate);
    }
    if (!nullToAbsent || observations != null) {
      map['observations'] = Variable<String>(observations);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ArtifactsCompanion toCompanion(bool nullToAbsent) {
    return ArtifactsCompanion(
      id: Value(id),
      missionId: Value(missionId),
      userId: Value(userId),
      type: Value(type),
      filePath: Value(filePath),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      registeredBy: Value(registeredBy),
      registrationDate: Value(registrationDate),
      originalDate: originalDate == null && nullToAbsent
          ? const Value.absent()
          : Value(originalDate),
      observations: observations == null && nullToAbsent
          ? const Value.absent()
          : Value(observations),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      createdAt: Value(createdAt),
    );
  }

  factory Artifact.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Artifact(
      id: serializer.fromJson<int>(json['id']),
      missionId: serializer.fromJson<int>(json['missionId']),
      userId: serializer.fromJson<int>(json['userId']),
      type: serializer.fromJson<String>(json['type']),
      filePath: serializer.fromJson<String>(json['filePath']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      registeredBy: serializer.fromJson<String>(json['registeredBy']),
      registrationDate: serializer.fromJson<DateTime>(json['registrationDate']),
      originalDate: serializer.fromJson<DateTime?>(json['originalDate']),
      observations: serializer.fromJson<String?>(json['observations']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'missionId': serializer.toJson<int>(missionId),
      'userId': serializer.toJson<int>(userId),
      'type': serializer.toJson<String>(type),
      'filePath': serializer.toJson<String>(filePath),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'registeredBy': serializer.toJson<String>(registeredBy),
      'registrationDate': serializer.toJson<DateTime>(registrationDate),
      'originalDate': serializer.toJson<DateTime?>(originalDate),
      'observations': serializer.toJson<String?>(observations),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Artifact copyWith({
    int? id,
    int? missionId,
    int? userId,
    String? type,
    String? filePath,
    String? title,
    Value<String?> description = const Value.absent(),
    String? registeredBy,
    DateTime? registrationDate,
    Value<DateTime?> originalDate = const Value.absent(),
    Value<String?> observations = const Value.absent(),
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
    DateTime? createdAt,
  }) => Artifact(
    id: id ?? this.id,
    missionId: missionId ?? this.missionId,
    userId: userId ?? this.userId,
    type: type ?? this.type,
    filePath: filePath ?? this.filePath,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    registeredBy: registeredBy ?? this.registeredBy,
    registrationDate: registrationDate ?? this.registrationDate,
    originalDate: originalDate.present ? originalDate.value : this.originalDate,
    observations: observations.present ? observations.value : this.observations,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
    createdAt: createdAt ?? this.createdAt,
  );
  Artifact copyWithCompanion(ArtifactsCompanion data) {
    return Artifact(
      id: data.id.present ? data.id.value : this.id,
      missionId: data.missionId.present ? data.missionId.value : this.missionId,
      userId: data.userId.present ? data.userId.value : this.userId,
      type: data.type.present ? data.type.value : this.type,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      registeredBy: data.registeredBy.present
          ? data.registeredBy.value
          : this.registeredBy,
      registrationDate: data.registrationDate.present
          ? data.registrationDate.value
          : this.registrationDate,
      originalDate: data.originalDate.present
          ? data.originalDate.value
          : this.originalDate,
      observations: data.observations.present
          ? data.observations.value
          : this.observations,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Artifact(')
          ..write('id: $id, ')
          ..write('missionId: $missionId, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('filePath: $filePath, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('registeredBy: $registeredBy, ')
          ..write('registrationDate: $registrationDate, ')
          ..write('originalDate: $originalDate, ')
          ..write('observations: $observations, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    missionId,
    userId,
    type,
    filePath,
    title,
    description,
    registeredBy,
    registrationDate,
    originalDate,
    observations,
    latitude,
    longitude,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Artifact &&
          other.id == this.id &&
          other.missionId == this.missionId &&
          other.userId == this.userId &&
          other.type == this.type &&
          other.filePath == this.filePath &&
          other.title == this.title &&
          other.description == this.description &&
          other.registeredBy == this.registeredBy &&
          other.registrationDate == this.registrationDate &&
          other.originalDate == this.originalDate &&
          other.observations == this.observations &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.createdAt == this.createdAt);
}

class ArtifactsCompanion extends UpdateCompanion<Artifact> {
  final Value<int> id;
  final Value<int> missionId;
  final Value<int> userId;
  final Value<String> type;
  final Value<String> filePath;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> registeredBy;
  final Value<DateTime> registrationDate;
  final Value<DateTime?> originalDate;
  final Value<String?> observations;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<DateTime> createdAt;
  const ArtifactsCompanion({
    this.id = const Value.absent(),
    this.missionId = const Value.absent(),
    this.userId = const Value.absent(),
    this.type = const Value.absent(),
    this.filePath = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.registeredBy = const Value.absent(),
    this.registrationDate = const Value.absent(),
    this.originalDate = const Value.absent(),
    this.observations = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ArtifactsCompanion.insert({
    this.id = const Value.absent(),
    required int missionId,
    required int userId,
    required String type,
    required String filePath,
    required String title,
    this.description = const Value.absent(),
    required String registeredBy,
    required DateTime registrationDate,
    this.originalDate = const Value.absent(),
    this.observations = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : missionId = Value(missionId),
       userId = Value(userId),
       type = Value(type),
       filePath = Value(filePath),
       title = Value(title),
       registeredBy = Value(registeredBy),
       registrationDate = Value(registrationDate);
  static Insertable<Artifact> custom({
    Expression<int>? id,
    Expression<int>? missionId,
    Expression<int>? userId,
    Expression<String>? type,
    Expression<String>? filePath,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? registeredBy,
    Expression<DateTime>? registrationDate,
    Expression<DateTime>? originalDate,
    Expression<String>? observations,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (missionId != null) 'mission_id': missionId,
      if (userId != null) 'user_id': userId,
      if (type != null) 'type': type,
      if (filePath != null) 'file_path': filePath,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (registeredBy != null) 'registered_by': registeredBy,
      if (registrationDate != null) 'registration_date': registrationDate,
      if (originalDate != null) 'original_date': originalDate,
      if (observations != null) 'observations': observations,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ArtifactsCompanion copyWith({
    Value<int>? id,
    Value<int>? missionId,
    Value<int>? userId,
    Value<String>? type,
    Value<String>? filePath,
    Value<String>? title,
    Value<String?>? description,
    Value<String>? registeredBy,
    Value<DateTime>? registrationDate,
    Value<DateTime?>? originalDate,
    Value<String?>? observations,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<DateTime>? createdAt,
  }) {
    return ArtifactsCompanion(
      id: id ?? this.id,
      missionId: missionId ?? this.missionId,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      filePath: filePath ?? this.filePath,
      title: title ?? this.title,
      description: description ?? this.description,
      registeredBy: registeredBy ?? this.registeredBy,
      registrationDate: registrationDate ?? this.registrationDate,
      originalDate: originalDate ?? this.originalDate,
      observations: observations ?? this.observations,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (missionId.present) {
      map['mission_id'] = Variable<int>(missionId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (registeredBy.present) {
      map['registered_by'] = Variable<String>(registeredBy.value);
    }
    if (registrationDate.present) {
      map['registration_date'] = Variable<DateTime>(registrationDate.value);
    }
    if (originalDate.present) {
      map['original_date'] = Variable<DateTime>(originalDate.value);
    }
    if (observations.present) {
      map['observations'] = Variable<String>(observations.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArtifactsCompanion(')
          ..write('id: $id, ')
          ..write('missionId: $missionId, ')
          ..write('userId: $userId, ')
          ..write('type: $type, ')
          ..write('filePath: $filePath, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('registeredBy: $registeredBy, ')
          ..write('registrationDate: $registrationDate, ')
          ..write('originalDate: $originalDate, ')
          ..write('observations: $observations, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ActionLogsTable extends ActionLogs
    with TableInfo<$ActionLogsTable, ActionLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActionLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _actionTypeMeta = const VerificationMeta(
    'actionType',
  );
  @override
  late final GeneratedColumn<String> actionType = GeneratedColumn<String>(
    'action_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, actionType, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'action_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActionLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('action_type')) {
      context.handle(
        _actionTypeMeta,
        actionType.isAcceptableOrUnknown(data['action_type']!, _actionTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_actionTypeMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActionLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActionLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      actionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action_type'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $ActionLogsTable createAlias(String alias) {
    return $ActionLogsTable(attachedDatabase, alias);
  }
}

class ActionLog extends DataClass implements Insertable<ActionLog> {
  final int id;
  final int userId;
  final String actionType;
  final DateTime timestamp;
  const ActionLog({
    required this.id,
    required this.userId,
    required this.actionType,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['action_type'] = Variable<String>(actionType);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  ActionLogsCompanion toCompanion(bool nullToAbsent) {
    return ActionLogsCompanion(
      id: Value(id),
      userId: Value(userId),
      actionType: Value(actionType),
      timestamp: Value(timestamp),
    );
  }

  factory ActionLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActionLog(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      actionType: serializer.fromJson<String>(json['actionType']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'actionType': serializer.toJson<String>(actionType),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  ActionLog copyWith({
    int? id,
    int? userId,
    String? actionType,
    DateTime? timestamp,
  }) => ActionLog(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    actionType: actionType ?? this.actionType,
    timestamp: timestamp ?? this.timestamp,
  );
  ActionLog copyWithCompanion(ActionLogsCompanion data) {
    return ActionLog(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      actionType: data.actionType.present
          ? data.actionType.value
          : this.actionType,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActionLog(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('actionType: $actionType, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, actionType, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActionLog &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.actionType == this.actionType &&
          other.timestamp == this.timestamp);
}

class ActionLogsCompanion extends UpdateCompanion<ActionLog> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> actionType;
  final Value<DateTime> timestamp;
  const ActionLogsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.actionType = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  ActionLogsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String actionType,
    this.timestamp = const Value.absent(),
  }) : userId = Value(userId),
       actionType = Value(actionType);
  static Insertable<ActionLog> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? actionType,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (actionType != null) 'action_type': actionType,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  ActionLogsCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<String>? actionType,
    Value<DateTime>? timestamp,
  }) {
    return ActionLogsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      actionType: actionType ?? this.actionType,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (actionType.present) {
      map['action_type'] = Variable<String>(actionType.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActionLogsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('actionType: $actionType, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $MissionsTable missions = $MissionsTable(this);
  late final $ArtifactsTable artifacts = $ArtifactsTable(this);
  late final $ActionLogsTable actionLogs = $ActionLogsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    missions,
    artifacts,
    actionLogs,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String username,
      required String password,
      required String role,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> username,
      Value<String> password,
      Value<String> role,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MissionsTable, List<Mission>> _missionsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.missions,
    aliasName: $_aliasNameGenerator(db.users.id, db.missions.createdBy),
  );

  $$MissionsTableProcessedTableManager get missionsRefs {
    final manager = $$MissionsTableTableManager(
      $_db,
      $_db.missions,
    ).filter((f) => f.createdBy.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_missionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ArtifactsTable, List<Artifact>>
  _artifactsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.artifacts,
    aliasName: $_aliasNameGenerator(db.users.id, db.artifacts.userId),
  );

  $$ArtifactsTableProcessedTableManager get artifactsRefs {
    final manager = $$ArtifactsTableTableManager(
      $_db,
      $_db.artifacts,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_artifactsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ActionLogsTable, List<ActionLog>>
  _actionLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.actionLogs,
    aliasName: $_aliasNameGenerator(db.users.id, db.actionLogs.userId),
  );

  $$ActionLogsTableProcessedTableManager get actionLogsRefs {
    final manager = $$ActionLogsTableTableManager(
      $_db,
      $_db.actionLogs,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_actionLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> missionsRefs(
    Expression<bool> Function($$MissionsTableFilterComposer f) f,
  ) {
    final $$MissionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.missions,
      getReferencedColumn: (t) => t.createdBy,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MissionsTableFilterComposer(
            $db: $db,
            $table: $db.missions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> artifactsRefs(
    Expression<bool> Function($$ArtifactsTableFilterComposer f) f,
  ) {
    final $$ArtifactsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.artifacts,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtifactsTableFilterComposer(
            $db: $db,
            $table: $db.artifacts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> actionLogsRefs(
    Expression<bool> Function($$ActionLogsTableFilterComposer f) f,
  ) {
    final $$ActionLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.actionLogs,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActionLogsTableFilterComposer(
            $db: $db,
            $table: $db.actionLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  Expression<T> missionsRefs<T extends Object>(
    Expression<T> Function($$MissionsTableAnnotationComposer a) f,
  ) {
    final $$MissionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.missions,
      getReferencedColumn: (t) => t.createdBy,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MissionsTableAnnotationComposer(
            $db: $db,
            $table: $db.missions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> artifactsRefs<T extends Object>(
    Expression<T> Function($$ArtifactsTableAnnotationComposer a) f,
  ) {
    final $$ArtifactsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.artifacts,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtifactsTableAnnotationComposer(
            $db: $db,
            $table: $db.artifacts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> actionLogsRefs<T extends Object>(
    Expression<T> Function($$ActionLogsTableAnnotationComposer a) f,
  ) {
    final $$ActionLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.actionLogs,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActionLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.actionLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({
            bool missionsRefs,
            bool artifactsRefs,
            bool actionLogsRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<String> role = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                username: username,
                password: password,
                role: role,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String username,
                required String password,
                required String role,
              }) => UsersCompanion.insert(
                id: id,
                username: username,
                password: password,
                role: role,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                missionsRefs = false,
                artifactsRefs = false,
                actionLogsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (missionsRefs) db.missions,
                    if (artifactsRefs) db.artifacts,
                    if (actionLogsRefs) db.actionLogs,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (missionsRefs)
                        await $_getPrefetchedData<User, $UsersTable, Mission>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._missionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).missionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.createdBy == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (artifactsRefs)
                        await $_getPrefetchedData<User, $UsersTable, Artifact>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._artifactsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).artifactsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (actionLogsRefs)
                        await $_getPrefetchedData<User, $UsersTable, ActionLog>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._actionLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).actionLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({
        bool missionsRefs,
        bool artifactsRefs,
        bool actionLogsRefs,
      })
    >;
typedef $$MissionsTableCreateCompanionBuilder =
    MissionsCompanion Function({
      Value<int> id,
      required String title,
      required String description,
      required DateTime startDate,
      required DateTime endDate,
      Value<String> status,
      required int createdBy,
    });
typedef $$MissionsTableUpdateCompanionBuilder =
    MissionsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<String> status,
      Value<int> createdBy,
    });

final class $$MissionsTableReferences
    extends BaseReferences<_$AppDatabase, $MissionsTable, Mission> {
  $$MissionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _createdByTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.missions.createdBy, db.users.id),
  );

  $$UsersTableProcessedTableManager get createdBy {
    final $_column = $_itemColumn<int>('created_by')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_createdByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ArtifactsTable, List<Artifact>>
  _artifactsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.artifacts,
    aliasName: $_aliasNameGenerator(db.missions.id, db.artifacts.missionId),
  );

  $$ArtifactsTableProcessedTableManager get artifactsRefs {
    final manager = $$ArtifactsTableTableManager(
      $_db,
      $_db.artifacts,
    ).filter((f) => f.missionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_artifactsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MissionsTableFilterComposer
    extends Composer<_$AppDatabase, $MissionsTable> {
  $$MissionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get createdBy {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.createdBy,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> artifactsRefs(
    Expression<bool> Function($$ArtifactsTableFilterComposer f) f,
  ) {
    final $$ArtifactsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.artifacts,
      getReferencedColumn: (t) => t.missionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtifactsTableFilterComposer(
            $db: $db,
            $table: $db.artifacts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MissionsTableOrderingComposer
    extends Composer<_$AppDatabase, $MissionsTable> {
  $$MissionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get createdBy {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.createdBy,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MissionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MissionsTable> {
  $$MissionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$UsersTableAnnotationComposer get createdBy {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.createdBy,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> artifactsRefs<T extends Object>(
    Expression<T> Function($$ArtifactsTableAnnotationComposer a) f,
  ) {
    final $$ArtifactsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.artifacts,
      getReferencedColumn: (t) => t.missionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArtifactsTableAnnotationComposer(
            $db: $db,
            $table: $db.artifacts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MissionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MissionsTable,
          Mission,
          $$MissionsTableFilterComposer,
          $$MissionsTableOrderingComposer,
          $$MissionsTableAnnotationComposer,
          $$MissionsTableCreateCompanionBuilder,
          $$MissionsTableUpdateCompanionBuilder,
          (Mission, $$MissionsTableReferences),
          Mission,
          PrefetchHooks Function({bool createdBy, bool artifactsRefs})
        > {
  $$MissionsTableTableManager(_$AppDatabase db, $MissionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MissionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MissionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MissionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime> endDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> createdBy = const Value.absent(),
              }) => MissionsCompanion(
                id: id,
                title: title,
                description: description,
                startDate: startDate,
                endDate: endDate,
                status: status,
                createdBy: createdBy,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String description,
                required DateTime startDate,
                required DateTime endDate,
                Value<String> status = const Value.absent(),
                required int createdBy,
              }) => MissionsCompanion.insert(
                id: id,
                title: title,
                description: description,
                startDate: startDate,
                endDate: endDate,
                status: status,
                createdBy: createdBy,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MissionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({createdBy = false, artifactsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (artifactsRefs) db.artifacts],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (createdBy) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.createdBy,
                                referencedTable: $$MissionsTableReferences
                                    ._createdByTable(db),
                                referencedColumn: $$MissionsTableReferences
                                    ._createdByTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (artifactsRefs)
                    await $_getPrefetchedData<
                      Mission,
                      $MissionsTable,
                      Artifact
                    >(
                      currentTable: table,
                      referencedTable: $$MissionsTableReferences
                          ._artifactsRefsTable(db),
                      managerFromTypedResult: (p0) => $$MissionsTableReferences(
                        db,
                        table,
                        p0,
                      ).artifactsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.missionId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MissionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MissionsTable,
      Mission,
      $$MissionsTableFilterComposer,
      $$MissionsTableOrderingComposer,
      $$MissionsTableAnnotationComposer,
      $$MissionsTableCreateCompanionBuilder,
      $$MissionsTableUpdateCompanionBuilder,
      (Mission, $$MissionsTableReferences),
      Mission,
      PrefetchHooks Function({bool createdBy, bool artifactsRefs})
    >;
typedef $$ArtifactsTableCreateCompanionBuilder =
    ArtifactsCompanion Function({
      Value<int> id,
      required int missionId,
      required int userId,
      required String type,
      required String filePath,
      required String title,
      Value<String?> description,
      required String registeredBy,
      required DateTime registrationDate,
      Value<DateTime?> originalDate,
      Value<String?> observations,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<DateTime> createdAt,
    });
typedef $$ArtifactsTableUpdateCompanionBuilder =
    ArtifactsCompanion Function({
      Value<int> id,
      Value<int> missionId,
      Value<int> userId,
      Value<String> type,
      Value<String> filePath,
      Value<String> title,
      Value<String?> description,
      Value<String> registeredBy,
      Value<DateTime> registrationDate,
      Value<DateTime?> originalDate,
      Value<String?> observations,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<DateTime> createdAt,
    });

final class $$ArtifactsTableReferences
    extends BaseReferences<_$AppDatabase, $ArtifactsTable, Artifact> {
  $$ArtifactsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MissionsTable _missionIdTable(_$AppDatabase db) =>
      db.missions.createAlias(
        $_aliasNameGenerator(db.artifacts.missionId, db.missions.id),
      );

  $$MissionsTableProcessedTableManager get missionId {
    final $_column = $_itemColumn<int>('mission_id')!;

    final manager = $$MissionsTableTableManager(
      $_db,
      $_db.missions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_missionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.artifacts.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ArtifactsTableFilterComposer
    extends Composer<_$AppDatabase, $ArtifactsTable> {
  $$ArtifactsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registeredBy => $composableBuilder(
    column: $table.registeredBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get registrationDate => $composableBuilder(
    column: $table.registrationDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get originalDate => $composableBuilder(
    column: $table.originalDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get observations => $composableBuilder(
    column: $table.observations,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MissionsTableFilterComposer get missionId {
    final $$MissionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.missionId,
      referencedTable: $db.missions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MissionsTableFilterComposer(
            $db: $db,
            $table: $db.missions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArtifactsTableOrderingComposer
    extends Composer<_$AppDatabase, $ArtifactsTable> {
  $$ArtifactsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registeredBy => $composableBuilder(
    column: $table.registeredBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get registrationDate => $composableBuilder(
    column: $table.registrationDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get originalDate => $composableBuilder(
    column: $table.originalDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get observations => $composableBuilder(
    column: $table.observations,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MissionsTableOrderingComposer get missionId {
    final $$MissionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.missionId,
      referencedTable: $db.missions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MissionsTableOrderingComposer(
            $db: $db,
            $table: $db.missions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArtifactsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArtifactsTable> {
  $$ArtifactsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get registeredBy => $composableBuilder(
    column: $table.registeredBy,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get registrationDate => $composableBuilder(
    column: $table.registrationDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get originalDate => $composableBuilder(
    column: $table.originalDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get observations => $composableBuilder(
    column: $table.observations,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$MissionsTableAnnotationComposer get missionId {
    final $$MissionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.missionId,
      referencedTable: $db.missions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MissionsTableAnnotationComposer(
            $db: $db,
            $table: $db.missions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArtifactsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ArtifactsTable,
          Artifact,
          $$ArtifactsTableFilterComposer,
          $$ArtifactsTableOrderingComposer,
          $$ArtifactsTableAnnotationComposer,
          $$ArtifactsTableCreateCompanionBuilder,
          $$ArtifactsTableUpdateCompanionBuilder,
          (Artifact, $$ArtifactsTableReferences),
          Artifact,
          PrefetchHooks Function({bool missionId, bool userId})
        > {
  $$ArtifactsTableTableManager(_$AppDatabase db, $ArtifactsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArtifactsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArtifactsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArtifactsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> missionId = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> registeredBy = const Value.absent(),
                Value<DateTime> registrationDate = const Value.absent(),
                Value<DateTime?> originalDate = const Value.absent(),
                Value<String?> observations = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ArtifactsCompanion(
                id: id,
                missionId: missionId,
                userId: userId,
                type: type,
                filePath: filePath,
                title: title,
                description: description,
                registeredBy: registeredBy,
                registrationDate: registrationDate,
                originalDate: originalDate,
                observations: observations,
                latitude: latitude,
                longitude: longitude,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int missionId,
                required int userId,
                required String type,
                required String filePath,
                required String title,
                Value<String?> description = const Value.absent(),
                required String registeredBy,
                required DateTime registrationDate,
                Value<DateTime?> originalDate = const Value.absent(),
                Value<String?> observations = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ArtifactsCompanion.insert(
                id: id,
                missionId: missionId,
                userId: userId,
                type: type,
                filePath: filePath,
                title: title,
                description: description,
                registeredBy: registeredBy,
                registrationDate: registrationDate,
                originalDate: originalDate,
                observations: observations,
                latitude: latitude,
                longitude: longitude,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ArtifactsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({missionId = false, userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (missionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.missionId,
                                referencedTable: $$ArtifactsTableReferences
                                    ._missionIdTable(db),
                                referencedColumn: $$ArtifactsTableReferences
                                    ._missionIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$ArtifactsTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$ArtifactsTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ArtifactsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ArtifactsTable,
      Artifact,
      $$ArtifactsTableFilterComposer,
      $$ArtifactsTableOrderingComposer,
      $$ArtifactsTableAnnotationComposer,
      $$ArtifactsTableCreateCompanionBuilder,
      $$ArtifactsTableUpdateCompanionBuilder,
      (Artifact, $$ArtifactsTableReferences),
      Artifact,
      PrefetchHooks Function({bool missionId, bool userId})
    >;
typedef $$ActionLogsTableCreateCompanionBuilder =
    ActionLogsCompanion Function({
      Value<int> id,
      required int userId,
      required String actionType,
      Value<DateTime> timestamp,
    });
typedef $$ActionLogsTableUpdateCompanionBuilder =
    ActionLogsCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<String> actionType,
      Value<DateTime> timestamp,
    });

final class $$ActionLogsTableReferences
    extends BaseReferences<_$AppDatabase, $ActionLogsTable, ActionLog> {
  $$ActionLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.actionLogs.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ActionLogsTableFilterComposer
    extends Composer<_$AppDatabase, $ActionLogsTable> {
  $$ActionLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActionLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $ActionLogsTable> {
  $$ActionLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActionLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActionLogsTable> {
  $$ActionLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActionLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActionLogsTable,
          ActionLog,
          $$ActionLogsTableFilterComposer,
          $$ActionLogsTableOrderingComposer,
          $$ActionLogsTableAnnotationComposer,
          $$ActionLogsTableCreateCompanionBuilder,
          $$ActionLogsTableUpdateCompanionBuilder,
          (ActionLog, $$ActionLogsTableReferences),
          ActionLog,
          PrefetchHooks Function({bool userId})
        > {
  $$ActionLogsTableTableManager(_$AppDatabase db, $ActionLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActionLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActionLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActionLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> actionType = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
              }) => ActionLogsCompanion(
                id: id,
                userId: userId,
                actionType: actionType,
                timestamp: timestamp,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required String actionType,
                Value<DateTime> timestamp = const Value.absent(),
              }) => ActionLogsCompanion.insert(
                id: id,
                userId: userId,
                actionType: actionType,
                timestamp: timestamp,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ActionLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$ActionLogsTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$ActionLogsTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ActionLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActionLogsTable,
      ActionLog,
      $$ActionLogsTableFilterComposer,
      $$ActionLogsTableOrderingComposer,
      $$ActionLogsTableAnnotationComposer,
      $$ActionLogsTableCreateCompanionBuilder,
      $$ActionLogsTableUpdateCompanionBuilder,
      (ActionLog, $$ActionLogsTableReferences),
      ActionLog,
      PrefetchHooks Function({bool userId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$MissionsTableTableManager get missions =>
      $$MissionsTableTableManager(_db, _db.missions);
  $$ArtifactsTableTableManager get artifacts =>
      $$ArtifactsTableTableManager(_db, _db.artifacts);
  $$ActionLogsTableTableManager get actionLogs =>
      $$ActionLogsTableTableManager(_db, _db.actionLogs);
}
