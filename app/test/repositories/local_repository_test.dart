import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pcos_companion/core/database/app_database.dart';
import 'package:pcos_companion/core/domain/app_types.dart';
import 'package:pcos_companion/features/meds/data/medication_repository.dart';
import 'package:pcos_companion/features/track/data/tracking_repository.dart';

void main() {
  late AppDatabase database;
  late MedicationRepository medicationRepository;
  late TrackingRepository trackingRepository;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    medicationRepository = MedicationRepository(database);
    trackingRepository = TrackingRepository(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('repositories persist medication and symptom records', () async {
    await medicationRepository.addMedication(
      const MedicationDraft(
        name: 'Metformin',
        dosage: '500 mg',
        frequency: 'Daily',
      ),
    );
    await trackingRepository.addSymptomEntry(
      const SymptomDraft(
        painSeverity: SymptomSeverity.moderate,
        acneSeverity: SymptomSeverity.mild,
        mood: WellbeingScale.steady,
        energy: WellbeingScale.low,
        sleepQuality: WellbeingScale.good,
      ),
    );

    final medications = await medicationRepository.fetchMedicationItems();
    final symptoms = await trackingRepository.fetchSymptoms();

    expect(medications.single.name, 'Metformin');
    expect(symptoms.single.painSeverity, SymptomSeverity.moderate);
  });
}

