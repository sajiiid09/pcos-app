import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pcos_companion/core/database/app_database.dart';
import 'package:pcos_companion/core/domain/app_types.dart';
import 'package:pcos_companion/features/onboarding/data/user_profile_repository.dart';
import 'package:pcos_companion/features/track/data/tracking_repository.dart';

void main() {
  late AppDatabase database;
  late UserProfileRepository userProfileRepository;
  late TrackingRepository trackingRepository;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    userProfileRepository = UserProfileRepository(database);
    trackingRepository = TrackingRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('repositories persist user profile and symptom records', () async {
    await userProfileRepository.saveProfile(
      const UserProfileDraft(
        name: 'Ava',
        ageRange: AgeRange.age25To34,
        diagnosisLabel: DiagnosisLabel.pcos,
        primaryGoal: PrimaryGoal.improveSymptoms,
      ),
    );
    await trackingRepository.saveSymptomEntry(
      SymptomDraft(
        loggedAt: DateTime(2026, 3, 29),
        painSeverity: SymptomSeverity.moderate,
        acneSeverity: SymptomSeverity.mild,
        mood: WellbeingScale.steady,
        energy: WellbeingScale.low,
        sleepQuality: WellbeingScale.good,
      ),
    );

    final profile = await userProfileRepository.getProfile();
    final symptoms = await trackingRepository.fetchSymptoms();

    expect(profile?.name, 'Ava');
    expect(profile?.primaryGoal, PrimaryGoal.improveSymptoms);
    expect(symptoms.single.painSeverity, SymptomSeverity.moderate);
  });
}
