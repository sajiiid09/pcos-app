import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/app_types.dart';
import '../../learn/data/evidence_library.dart';
import '../../meds/application/medication_list_state.dart';
import '../../track/application/tracking_state.dart';

final dailySummaryProvider = Provider<DailySummaryState>((ref) {
  final medicationState =
      ref.watch(medicationListControllerProvider).value ??
          MedicationListState.initial();
  final trackingState =
      ref.watch(trackingControllerProvider).value ??
          TrackingState.initial();
  final articles = ref.watch(evidenceArticlesProvider);

  final latestCycle = trackingState.snapshot.latestCycle;
  final latestSymptom = trackingState.snapshot.latestSymptom;
  final latestHabit = trackingState.snapshot.latestHabit;

  return DailySummaryState(
    activeMedicationCount: medicationState.items.length,
    nextReminderLabel: medicationState.items.isEmpty
        ? 'No medication reminders yet'
        : '${medicationState.items.first.name} · ${medicationState.items.first.frequency}',
    cycleDayLabel: latestCycle == null
        ? 'No cycle logged yet'
        : 'Cycle started ${formatCompactDate(latestCycle.startDate)}',
    habitHeadline: latestHabit == null
        ? 'No habit log yet'
        : '${latestHabit.movementMinutes} min movement · '
            '${latestHabit.hydrationGlasses} glasses',
    symptomHeadline: latestSymptom == null
        ? 'No symptom check-in yet'
        : 'Pain ${latestSymptom.painSeverity.label} · '
            'Energy ${latestSymptom.energy.label}',
    evidenceTip: articles.first.summary,
  );
});
