import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/app_types.dart';
import '../../onboarding/application/onboarding_controller.dart';
import '../../track/application/tracking_state.dart';

final homeDashboardProvider = Provider<HomeDashboardState>((ref) {
  final profile = ref.watch(onboardingControllerProvider).value;
  final trackingState =
      ref.watch(trackingControllerProvider).value ?? TrackingState.initial();
  final latestSymptom = trackingState.snapshot.latestSymptom;
  final currentCycle = trackingState.snapshot.currentCycle;
  final latestCycle = trackingState.snapshot.latestCycle;
  final name = profile?.name.trim();

  final greeting = name == null || name.isEmpty ? 'Hi there' : 'Hi, $name';

  final latestSymptomSummary = latestSymptom == null
      ? 'No symptom entry yet. Log one from the Track tab.'
      : 'Last check-in ${formatCompactDateTime(latestSymptom.loggedAt)} · '
            'Pain ${latestSymptom.painSeverity.label} · '
            'Mood ${latestSymptom.mood.label} · '
            'Energy ${latestSymptom.energy.label}';

  final cycleStatus = currentCycle != null
      ? 'Current period started ${formatCompactDate(currentCycle.startDate)}.'
      : latestCycle?.endDate != null
      ? 'Last period ended ${formatCompactDate(latestCycle!.endDate!)}.'
      : 'No period logged yet.';

  return HomeDashboardState(
    greeting: greeting,
    dateLabel: formatFullDate(DateTime.now()),
    primaryGoalLabel: profile?.primaryGoal.label ?? 'General wellness',
    latestSymptomSummary: latestSymptomSummary,
    cycleStatus: cycleStatus,
    hasActiveCycle: currentCycle != null,
  );
});
