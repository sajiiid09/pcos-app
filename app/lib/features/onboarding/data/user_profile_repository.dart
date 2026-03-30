import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';
import '../../../core/domain/app_types.dart';

final userProfileRepositoryProvider = Provider<UserProfileRepository>((ref) {
  return UserProfileRepository(ref.read(appDatabaseProvider));
});

class UserProfileRepository {
  UserProfileRepository(this._database);

  final AppDatabase _database;
  final Uuid _uuid = const Uuid();

  Future<void> prepareForLaunch() async {
    final hasSavedProfile = await hasProfile();
    if (hasSavedProfile) {
      return;
    }

    await _database.transaction(() async {
      await _database.delete(_database.medicationLogs).go();
      await _database.delete(_database.medications).go();
      await _database.delete(_database.cycleEntries).go();
      await _database.delete(_database.symptomEntries).go();
      await _database.delete(_database.habitLogs).go();
    });
  }

  Future<bool> hasProfile() async {
    final profile = await (_database.select(
      _database.userProfiles,
    )..limit(1)).getSingleOrNull();
    return profile != null;
  }

  Future<UserProfileRecord?> getProfile() async {
    final row =
        await (_database.select(_database.userProfiles)
              ..orderBy([(table) => OrderingTerm.desc(table.createdAt)])
              ..limit(1))
            .getSingleOrNull();

    if (row == null) {
      return null;
    }

    return UserProfileRecord(
      id: row.id,
      name: row.name,
      ageRange: row.ageRange,
      diagnosisLabel: row.diagnosisLabel,
      primaryGoal: row.primaryGoal,
      createdAt: row.createdAt,
    );
  }

  Future<void> saveProfile(UserProfileDraft draft) async {
    final existingProfiles = await _database
        .select(_database.userProfiles)
        .get();

    await _database.transaction(() async {
      if (existingProfiles.isNotEmpty) {
        await _database.delete(_database.userProfiles).go();
      }

      await _database
          .into(_database.userProfiles)
          .insert(
            UserProfilesCompanion.insert(
              id: _uuid.v4(),
              name: draft.name.trim(),
              ageRange: draft.ageRange,
              diagnosisLabel: draft.diagnosisLabel,
              primaryGoal: draft.primaryGoal,
              createdAt: DateTime.now(),
            ),
          );
    });
  }
}
