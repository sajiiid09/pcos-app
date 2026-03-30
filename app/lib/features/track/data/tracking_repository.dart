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
    final latestCycle = await _latestCycle();
    return TrackingSnapshot(
      currentCycle: await getCurrentCycle(),
      latestCycle: latestCycle,
      latestSymptom: await getLatestSymptomEntry(),
      latestHabit: await _latestHabit(),
    );
  }

  Future<List<CycleEntryRecord>> fetchCycles() async {
    final rows = await (_database.select(
      _database.cycleEntries,
    )..orderBy([(table) => OrderingTerm.desc(table.startDate)])).get();
    return rows.map(_cycleFromRow).toList();
  }

  Future<List<SymptomEntryRecord>> fetchSymptoms() async {
    final rows = await (_database.select(
      _database.symptomEntries,
    )..orderBy([(table) => OrderingTerm.desc(table.loggedAt)])).get();
    return rows.map(_symptomFromRow).toList();
  }

  Future<List<HabitLogRecord>> fetchHabits() async {
    final rows = await (_database.select(
      _database.habitLogs,
    )..orderBy([(table) => OrderingTerm.desc(table.loggedAt)])).get();
    return rows.map(_habitFromRow).toList();
  }

  Future<SymptomEntryRecord?> getLatestSymptomEntry() async {
    final row =
        await (_database.select(_database.symptomEntries)
              ..orderBy([(table) => OrderingTerm.desc(table.loggedAt)])
              ..limit(1))
            .getSingleOrNull();
    return row == null ? null : _symptomFromRow(row);
  }

  Future<CycleEntryRecord?> getCurrentCycle() async {
    final row =
        await (_database.select(_database.cycleEntries)
              ..where((table) => table.endDate.isNull())
              ..orderBy([(table) => OrderingTerm.desc(table.startDate)])
              ..limit(1))
            .getSingleOrNull();
    return row == null ? null : _cycleFromRow(row);
  }

  Future<void> saveSymptomEntry(SymptomDraft draft) async {
    await _database
        .into(_database.symptomEntries)
        .insert(
          SymptomEntriesCompanion.insert(
            id: _uuid.v4(),
            loggedAt: draft.loggedAt,
            painSeverity: draft.painSeverity,
            acneSeverity: draft.acneSeverity,
            mood: draft.mood,
            energy: draft.energy,
            sleepQuality: draft.sleepQuality,
            notes: draft.notes.asNullableValue(),
          ),
        );
  }

  Future<bool> startCycle({
    required DateTime startDate,
    FlowLevel? flowLevel,
    String notes = '',
  }) async {
    final currentCycle = await getCurrentCycle();
    if (currentCycle != null) {
      return false;
    }

    await _database
        .into(_database.cycleEntries)
        .insert(
          CycleEntriesCompanion.insert(
            id: _uuid.v4(),
            startDate: dateOnly(startDate),
            endDate: const Value.absent(),
            flowLevel: Value(flowLevel),
            notes: notes.asNullableValue(),
          ),
        );
    return true;
  }

  Future<bool> endCycle({
    required DateTime endDate,
    FlowLevel? flowLevel,
    String notes = '',
  }) async {
    final currentCycle = await getCurrentCycle();
    if (currentCycle == null) {
      return false;
    }

    await (_database.update(
      _database.cycleEntries,
    )..where((table) => table.id.equals(currentCycle.id))).write(
      CycleEntriesCompanion(
        endDate: Value(dateOnly(endDate)),
        flowLevel: Value(flowLevel),
        notes: notes.asNullableValue(),
      ),
    );

    return true;
  }

  Future<void> addHabitLog(HabitDraft draft) async {
    await _database
        .into(_database.habitLogs)
        .insert(
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

  Future<CycleEntryRecord?> _latestCycle() async {
    final row =
        await (_database.select(_database.cycleEntries)
              ..orderBy([(table) => OrderingTerm.desc(table.startDate)])
              ..limit(1))
            .getSingleOrNull();
    return row == null ? null : _cycleFromRow(row);
  }

  Future<HabitLogRecord?> _latestHabit() async {
    final row =
        await (_database.select(_database.habitLogs)
              ..orderBy([(table) => OrderingTerm.desc(table.loggedAt)])
              ..limit(1))
            .getSingleOrNull();
    return row == null ? null : _habitFromRow(row);
  }

  CycleEntryRecord _cycleFromRow(CycleEntry row) {
    return CycleEntryRecord(
      id: row.id,
      startDate: row.startDate,
      endDate: row.endDate,
      flowLevel: row.flowLevel,
      notes: row.notes,
    );
  }

  SymptomEntryRecord _symptomFromRow(SymptomEntry row) {
    return SymptomEntryRecord(
      id: row.id,
      loggedAt: row.loggedAt,
      painSeverity: row.painSeverity,
      acneSeverity: row.acneSeverity,
      mood: row.mood,
      energy: row.energy,
      sleepQuality: row.sleepQuality,
      notes: row.notes,
    );
  }

  HabitLogRecord _habitFromRow(HabitLog row) {
    return HabitLogRecord(
      id: row.id,
      loggedAt: row.loggedAt,
      movementMinutes: row.movementMinutes,
      hydrationGlasses: row.hydrationGlasses,
      sleepHours: row.sleepHours,
      stressLevel: row.stressLevel,
    );
  }
}
