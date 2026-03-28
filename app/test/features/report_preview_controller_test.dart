import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:pcos_companion/core/domain/app_types.dart';
import 'package:pcos_companion/core/database/app_database.dart';
import 'package:pcos_companion/features/meds/application/medication_list_state.dart';
import 'package:pcos_companion/features/meds/data/medication_repository.dart';
import 'package:pcos_companion/features/reports/application/report_preview_controller.dart';
import 'package:pcos_companion/features/reports/data/report_repository.dart';
import 'package:pcos_companion/features/track/application/tracking_state.dart';
import 'package:pcos_companion/features/track/data/tracking_repository.dart';

import '../test_helpers.dart';

class _FailingReportRepository extends ReportRepository {
  _FailingReportRepository()
      : super(
          medicationRepository:
              MedicationRepository(AppDatabase(NativeDatabase.memory())),
          trackingRepository: TrackingRepository(AppDatabase(NativeDatabase.memory())),
        );

  @override
  Future<DoctorSummaryPreview> buildPreview() async {
    throw Exception('preview failure');
  }
}

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
    await container.read(trackingControllerProvider.notifier).addHabitLog(
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

  test('report preview refresh captures failures as AsyncError', () async {
    final container = createContainer(
      overrides: [
        reportRepositoryProvider.overrideWithValue(_FailingReportRepository()),
      ],
    );
    addTearDown(container.dispose);

    await expectLater(
      container.read(reportPreviewControllerProvider.future),
      throwsA(isA<Exception>()),
    );

    await container.read(reportPreviewControllerProvider.notifier).refresh();
    final state = container.read(reportPreviewControllerProvider);
    expect(state.hasError, isTrue);
  });
}

