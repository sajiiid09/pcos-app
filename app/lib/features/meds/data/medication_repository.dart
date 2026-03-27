import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';
import '../../../core/domain/app_types.dart';

final medicationRepositoryProvider = Provider<MedicationRepository>((ref) {
  return MedicationRepository(ref.read(appDatabaseProvider));
});

class MedicationRepository {
  MedicationRepository(this._database);

  final AppDatabase _database;
  final Uuid _uuid = const Uuid();

  Future<List<MedicationListItem>> fetchMedicationItems() async {
    final query = _database.select(_database.medications)
      ..orderBy([(table) => OrderingTerm.desc(table.createdAt)]);
    final medications = await query.get();

    return Future.wait(
      medications.map((medication) async {
        final logQuery = _database.select(_database.medicationLogs)
          ..where((table) => table.medicationId.equals(medication.id))
          ..orderBy([(table) => OrderingTerm.desc(table.loggedAt)])
          ..limit(1);
        final latestLog = await logQuery.getSingleOrNull();

        return MedicationListItem(
          id: medication.id,
          name: medication.name,
          dosage: medication.dosage,
          frequency: medication.frequency,
          notes: medication.notes,
          lastStatus: latestLog?.status,
          lastLoggedAt: latestLog?.loggedAt,
        );
      }),
    );
  }

  Future<List<Medication>> fetchMedications() async {
    return _database.select(_database.medications).get();
  }

  Future<List<MedicationLog>> fetchMedicationLogs() async {
    final query = _database.select(_database.medicationLogs)
      ..orderBy([(table) => OrderingTerm.desc(table.loggedAt)]);
    return query.get();
  }

  Future<void> addMedication(MedicationDraft draft) async {
    await _database.into(_database.medications).insert(
          MedicationsCompanion.insert(
            id: _uuid.v4(),
            name: draft.name.trim(),
            dosage: draft.dosage.trim(),
            frequency: draft.frequency.trim(),
            notes: draft.notes.asNullableValue(),
            createdAt: DateTime.now(),
          ),
        );
  }

  Future<void> logMedication({
    required String medicationId,
    required MedicationLogStatus status,
  }) async {
    final now = DateTime.now();
    await _database.into(_database.medicationLogs).insert(
          MedicationLogsCompanion.insert(
            id: _uuid.v4(),
            medicationId: medicationId,
            status: status,
            scheduledFor: now,
            loggedAt: now,
          ),
        );
  }
}

