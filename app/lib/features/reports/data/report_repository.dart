import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/app_types.dart';
import '../../meds/data/medication_repository.dart';
import '../../track/data/tracking_repository.dart';

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  return ReportRepository(
    medicationRepository: ref.read(medicationRepositoryProvider),
    trackingRepository: ref.read(trackingRepositoryProvider),
  );
});

class ReportRepository {
  ReportRepository({
    required MedicationRepository medicationRepository,
    required TrackingRepository trackingRepository,
  }) : _medicationRepository = medicationRepository,
       _trackingRepository = trackingRepository;

  final MedicationRepository _medicationRepository;
  final TrackingRepository _trackingRepository;

  Future<DoctorSummaryPreview> buildPreview() async {
    final medications = await _medicationRepository.fetchMedications();
    final logs = await _medicationRepository.fetchMedicationLogs();
    final cycles = await _trackingRepository.fetchCycles();
    final symptoms = await _trackingRepository.fetchSymptoms();
    final habits = await _trackingRepository.fetchHabits();

    final takenCount = logs
        .where((log) => log.status == MedicationLogStatus.taken)
        .length;
    final adherenceRate = logs.isEmpty
        ? 0.0
        : (takenCount / logs.length) * 100.0;

    final latestCycle = cycles.isEmpty ? null : cycles.first;
    final latestSymptom = symptoms.isEmpty ? null : symptoms.first;
    final latestHabit = habits.isEmpty ? null : habits.first;

    final questions = <String>[
      if (adherenceRate < 80 && logs.isNotEmpty)
        'Can we simplify my medication routine?'
      else
        'Are my current medications and timing still appropriate?',
      if (latestSymptom?.painSeverity == SymptomSeverity.severe)
        'What should I do when pain spikes?'
      else
        'Which symptom patterns matter most between visits?',
    ];

    return DoctorSummaryPreview(
      generatedAt: DateTime.now(),
      activeMedicationCount: medications.length,
      adherenceRate: adherenceRate,
      cycleSummary: latestCycle == null
          ? 'No cycle entry has been logged yet.'
          : 'Latest cycle started ${formatCompactDate(latestCycle.startDate)}.',
      symptomSummary: latestSymptom == null
          ? 'No symptom trend yet.'
          : 'Pain is ${latestSymptom.painSeverity.label.toLowerCase()}, mood is '
                '${latestSymptom.mood.label.toLowerCase()}, and energy is '
                '${latestSymptom.energy.label.toLowerCase()}.',
      lifestyleSummary: latestHabit == null
          ? 'No habit log yet.'
          : '${latestHabit.movementMinutes} minutes of movement, '
                '${latestHabit.hydrationGlasses} glasses of water, '
                '${latestHabit.sleepHours.toStringAsFixed(1)} hours of sleep.',
      questionsForDoctor: questions,
    );
  }
}
