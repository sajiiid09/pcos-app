import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';
import '../../../core/domain/app_types.dart';

final trackingRepositoryProvider = Provider<TrackingRepository>((ref) {
  return TrackingRepository(ref.read(appDatabaseProvider));
});

class TrackingRepository {
  TrackingRepository(this._database);

  final AppDatabase _database;
  final Uuid _uuid = const Uuid();

  Future<TrackingSnapshot> fetchSnapshot() async {
    final latestCycleRow = await (_database.select(_database.cycleEntries)
          ..orderBy([(table) => OrderingTerm.desc(table.startDate)])
          ..limit(1))
        .getSingleOrNull();
    final latestSymptomRow = await (_database.select(_database.symptomEntries)
          ..orderBy([(table) => OrderingTerm.desc(table.loggedAt)])
          ..limit(1))
        .getSingleOrNull();
    final latestHabitRow = await (_database.select(_database.habitLogs)
          ..orderBy([(table) => OrderingTerm.desc(table.loggedAt)])
          ..limit(1))
        .getSingleOrNull();

    return TrackingSnapshot(
      latestCycle: latestCycleRow == null
          ? null
          : CycleEntryRecord(
              id: latestCycleRow.id,
              startDate: latestCycleRow.startDate,
              endDate: latestCycleRow.endDate,
            ),
      latestSymptom: latestSymptomRow == null
          ? null
          : SymptomEntryRecord(
              id: latestSymptomRow.id,
              loggedAt: latestSymptomRow.loggedAt,
              painSeverity: latestSymptomRow.painSeverity,
              acneSeverity: latestSymptomRow.acneSeverity,
              mood: latestSymptomRow.mood,
              energy: latestSymptomRow.energy,
              sleepQuality: latestSymptomRow.sleepQuality,
              notes: latestSymptomRow.notes,
            ),
      latestHabit: latestHabitRow == null
          ? null
          : HabitLogRecord(
              id: latestHabitRow.id,
              loggedAt: latestHabitRow.loggedAt,
              movementMinutes: latestHabitRow.movementMinutes,
              hydrationGlasses: latestHabitRow.hydrationGlasses,
              sleepHours: latestHabitRow.sleepHours,
              stressLevel: latestHabitRow.stressLevel,
            ),
    );
  }

  Future<List<CycleEntryRecord>> fetchCycles() async {
    final query = _database.select(_database.cycleEntries)
      ..orderBy([(table) => OrderingTerm.desc(table.startDate)]);
    final rows = await query.get();
    return rows
        .map(
          (row) => CycleEntryRecord(
            id: row.id,
            startDate: row.startDate,
            endDate: row.endDate,
          ),
        )
        .toList();
  }

  Future<List<SymptomEntryRecord>> fetchSymptoms() async {
    final query = _database.select(_database.symptomEntries)
      ..orderBy([(table) => OrderingTerm.desc(table.loggedAt)]);
    final rows = await query.get();
    return rows
        .map(
          (row) => SymptomEntryRecord(
            id: row.id,
            loggedAt: row.loggedAt,
            painSeverity: row.painSeverity,
            acneSeverity: row.acneSeverity,
            mood: row.mood,
            energy: row.energy,
            sleepQuality: row.sleepQuality,
            notes: row.notes,
          ),
        )
        .toList();
  }

  Future<List<HabitLogRecord>> fetchHabits() async {
    final query = _database.select(_database.habitLogs)
      ..orderBy([(table) => OrderingTerm.desc(table.loggedAt)]);
    final rows = await query.get();
    return rows
        .map(
          (row) => HabitLogRecord(
            id: row.id,
            loggedAt: row.loggedAt,
            movementMinutes: row.movementMinutes,
            hydrationGlasses: row.hydrationGlasses,
            sleepHours: row.sleepHours,
            stressLevel: row.stressLevel,
          ),
        )
        .toList();
  }

  Future<void> addSymptomEntry(SymptomDraft draft) async {
    await _database.into(_database.symptomEntries).insert(
          SymptomEntriesCompanion.insert(
            id: _uuid.v4(),
            loggedAt: DateTime.now(),
            painSeverity: draft.painSeverity,
            acneSeverity: draft.acneSeverity,
            mood: draft.mood,
            energy: draft.energy,
            sleepQuality: draft.sleepQuality,
            notes: draft.notes.asNullableValue(),
          ),
        );
  }

  Future<void> startCycleToday() async {
    await _database.into(_database.cycleEntries).insert(
          CycleEntriesCompanion.insert(
            id: _uuid.v4(),
            startDate: dateOnly(DateTime.now()),
            endDate: const Value.absent(),
          ),
        );
  }

  Future<void> addHabitLog(HabitDraft draft) async {
    await _database.into(_database.habitLogs).insert(
          HabitLogsCompanion.insert(
            id: _uuid.v4(),
            loggedAt: DateTime.now(),
            movementMinutes: draft.movementMinutes,
            hydrationGlasses: draft.hydrationGlasses,
            sleepHours: draft.sleepHours,
            stressLevel: draft.stressLevel,
          ),
        );
  }
}
