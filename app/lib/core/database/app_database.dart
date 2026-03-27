import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../domain/app_types.dart';

part 'app_database.g.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

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
  tables: [Medications, MedicationLogs, CycleEntries, SymptomEntries, HabitLogs],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> seedDemoData() async {
    final existingMedication = await (select(medications)..limit(1)).getSingleOrNull();
    if (existingMedication != null) {
      return;
    }

    const uuid = Uuid();
    final now = DateTime.now();
    final medicationId = uuid.v4();

    await transaction(() async {
      await into(medications).insert(
        MedicationsCompanion.insert(
          id: medicationId,
          name: 'Metformin',
          dosage: '500 mg',
          frequency: 'Twice daily',
          notes: const Value('Take with food.'),
          createdAt: now.subtract(const Duration(days: 14)),
        ),
      );

      await into(medicationLogs).insert(
        MedicationLogsCompanion.insert(
          id: uuid.v4(),
          medicationId: medicationId,
          status: MedicationLogStatus.taken,
          scheduledFor: now.subtract(const Duration(hours: 2)),
          loggedAt: now.subtract(const Duration(hours: 2)),
        ),
      );

      await into(cycleEntries).insert(
        CycleEntriesCompanion.insert(
          id: uuid.v4(),
          startDate: dateOnly(now.subtract(const Duration(days: 4))),
          endDate: const Value.absent(),
        ),
      );

      await into(symptomEntries).insert(
        SymptomEntriesCompanion.insert(
          id: uuid.v4(),
          loggedAt: now.subtract(const Duration(hours: 1)),
          painSeverity: SymptomSeverity.moderate,
          acneSeverity: SymptomSeverity.mild,
          mood: WellbeingScale.steady,
          energy: WellbeingScale.low,
          sleepQuality: WellbeingScale.steady,
          notes: const Value('Energy dipped after lunch.'),
        ),
      );

      await into(habitLogs).insert(
        HabitLogsCompanion.insert(
          id: uuid.v4(),
          loggedAt: now.subtract(const Duration(minutes: 30)),
          movementMinutes: 25,
          hydrationGlasses: 6,
          sleepHours: 7.0,
          stressLevel: WellbeingScale.steady,
        ),
      );
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File(p.join(directory.path, 'pcos_companion.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
