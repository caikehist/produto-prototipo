import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username =>
      text().withLength(min: 3, max: 20).customConstraint('UNIQUE')();
  TextColumn get password => text()();
  TextColumn get role => text()();
}

class Missions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  TextColumn get status => text().withDefault(const Constant('PENDENTE'))();
  IntColumn get createdBy => integer().references(Users, #id)();
}

class Artifacts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get missionId => integer().references(Missions, #id)();
  IntColumn get userId => integer().references(Users, #id)();
  TextColumn get type => text()();
  TextColumn get filePath => text()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  TextColumn get registeredBy => text()();
  DateTimeColumn get registrationDate => dateTime()();
  DateTimeColumn get originalDate => dateTime().nullable()();
  TextColumn get observations => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class ActionLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(Users, #id)();
  TextColumn get actionType => text()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [Users, Missions, Artifacts, ActionLogs])
class AppDatabase extends _$AppDatabase {
  AppDatabase({QueryExecutor? connection})
    : super(connection ?? _openConnection());
  @override
  int get schemaVersion => 1;
  Future<User?> validateUser(String user, String pass) {
    return (select(users)
          ..where((u) => u.username.equals(user) & u.password.equals(pass)))
        .getSingleOrNull();
  }

  Future<int> logAction(int userId, String action) {
    return into(
      actionLogs,
    ).insert(ActionLogsCompanion.insert(userId: userId, actionType: action));
  }

  Future<int> deleteArtifact(int id) {
    return (delete(artifacts)..where((t) => t.id.equals(id))).go();
  }

  Future<void> seedDatabase() async {
    final count = await select(users).get();
    if (count.isEmpty) {
      await into(users).insert(
        UsersCompanion.insert(
          username: 'professor',
          password: '123',
          role: 'PROFESSOR_ORGANIZADOR',
        ),
      );
      await into(users).insert(
        UsersCompanion.insert(
          username: 'aluno',
          password: '123',
          role: 'ALUNO',
        ),
      );
      await into(missions).insert(
        MissionsCompanion.insert(
          title: 'Educação Patrimonial',
          description: 'Registre o patrimônio local.',
          startDate: DateTime.now(),
          endDate: DateTime.now().add(const Duration(days: 30)),
          createdBy: 1,
        ),
      );
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'patrimonio.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
