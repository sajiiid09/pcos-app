import 'package:flutter_test/flutter_test.dart';
import 'package:pcos_companion/core/domain/app_types.dart';
import 'package:pcos_companion/features/meds/application/medication_list_state.dart';
import 'package:pcos_companion/features/reports/application/report_preview_controller.dart';
import 'package:pcos_companion/features/track/application/tracking_state.dart';

import '../test_helpers.dart';

void main() {
  test('report preview reflects local medication and symptom data', () async {
    final container = createContainer();
    addTearDown(container.dispose);

    await container.read(medicationListControllerProvider.future);
    await container.read(trackingControllerProvider.future);

    await container
        .read(medicationListControllerProvider.notifier)
        .addMedication(
          const MedicationDraft(
            name: 'Vitamin D',
            dosage: '1000 IU',
            frequency: 'Daily',
          ),
        );
    await container
        .read(trackingControllerProvider.notifier)
        .addHabitLog(
          const HabitDraft(
            movementMinutes: 30,
            hydrationGlasses: 7,
            sleepHours: 7.5,
            stressLevel: WellbeingScale.steady,
          ),
        );

    final report = await container.read(reportPreviewControllerProvider.future);
    expect(report.activeMedicationCount, greaterThanOrEqualTo(1));
    expect(report.lifestyleSummary, contains('30 minutes'));
  });
}
