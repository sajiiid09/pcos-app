import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../domain/app_types.dart';

part 'app_database.g.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

class UserProfiles extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get ageRange => textEnum<AgeRange>()();
  TextColumn get diagnosisLabel => textEnum<DiagnosisLabel>()();
  TextColumn get primaryGoal => textEnum<PrimaryGoal>()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class Medications extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get dosage => text()();
  TextColumn get frequency => text()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class MedicationLogs extends Table {
  TextColumn get id => text()();
  TextColumn get medicationId => text().references(Medications, #id)();
  TextColumn get status => textEnum<MedicationLogStatus>()();
  DateTimeColumn get scheduledFor => dateTime()();
  DateTimeColumn get loggedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class CycleEntries extends Table {
  TextColumn get id => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  TextColumn get flowLevel => textEnum<FlowLevel>().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class SymptomEntries extends Table {
  TextColumn get id => text()();
  DateTimeColumn get loggedAt => dateTime()();
  TextColumn get painSeverity => textEnum<SymptomSeverity>()();
  TextColumn get acneSeverity => textEnum<SymptomSeverity>()();
  TextColumn get mood => textEnum<WellbeingScale>()();
  TextColumn get energy => textEnum<WellbeingScale>()();
  TextColumn get sleepQuality => textEnum<WellbeingScale>()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class HabitLogs extends Table {
  TextColumn get id => text()();
  DateTimeColumn get loggedAt => dateTime()();
  IntColumn get movementMinutes => integer()();
  IntColumn get hydrationGlasses => integer()();
  RealColumn get sleepHours => real()();
  TextColumn get stressLevel => textEnum<WellbeingScale>()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DriftDatabase(
  tables: [
    UserProfiles,
    Medications,
    MedicationLogs,
    CycleEntries,
    SymptomEntries,
    HabitLogs,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
    },
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.createTable(userProfiles);
        await migrator.addColumn(cycleEntries, cycleEntries.flowLevel);
        await migrator.addColumn(cycleEntries, cycleEntries.notes);
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(p.join(directory.path, 'pcos_companion.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
