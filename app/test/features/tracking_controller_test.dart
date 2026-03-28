import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:pcos_companion/core/domain/app_types.dart';
import 'package:pcos_companion/core/database/app_database.dart';
import 'package:pcos_companion/features/track/application/tracking_state.dart';
import 'package:pcos_companion/features/track/data/tracking_repository.dart';

import '../test_helpers.dart';

class _FailingTrackingRepository extends TrackingRepository {
  _FailingTrackingRepository() : super(AppDatabase(NativeDatabase.memory()));

  @override
  Future<void> addSymptomEntry(SymptomDraft draft) async {
    throw Exception('write failure');
  }
}

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

  test('tracking controller exposes recoverable error state on failure', () async {
    final container = createContainer(
      overrides: [
        trackingRepositoryProvider.overrideWithValue(_FailingTrackingRepository()),
      ],
    );
    addTearDown(container.dispose);

    await container.read(trackingControllerProvider.future);

    await container.read(trackingControllerProvider.notifier).addSymptomEntry(
          const SymptomDraft(
            painSeverity: SymptomSeverity.mild,
            acneSeverity: SymptomSeverity.none,
            mood: WellbeingScale.good,
            energy: WellbeingScale.steady,
            sleepQuality: WellbeingScale.good,
          ),
        );

    final state = container.read(trackingControllerProvider).value;
    expect(state, isNotNull);
    expect(state!.errorMessage, isNotNull);
    expect(state.isSaving, isFalse);
  });
}

