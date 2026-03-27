import 'package:flutter_test/flutter_test.dart';
import 'package:pcos_companion/core/domain/app_types.dart';
import 'package:pcos_companion/features/track/application/tracking_state.dart';

import '../test_helpers.dart';

void main() {
  test('tracking controller stores symptom and cycle entries', () async {
    final container = createContainer();
    addTearDown(container.dispose);

    await container.read(trackingControllerProvider.future);

    await container.read(trackingControllerProvider.notifier).addSymptomEntry(
          const SymptomDraft(
            painSeverity: SymptomSeverity.mild,
            acneSeverity: SymptomSeverity.none,
            mood: WellbeingScale.good,
            energy: WellbeingScale.steady,
            sleepQuality: WellbeingScale.good,
            notes: 'Felt more stable today.',
          ),
        );
    await container.read(trackingControllerProvider.notifier).startCycleToday();

    final state = await container.read(trackingControllerProvider.future);
    expect(state.snapshot.latestSymptom?.notes, 'Felt more stable today.');
    expect(state.snapshot.latestCycle, isNotNull);
  });
}

