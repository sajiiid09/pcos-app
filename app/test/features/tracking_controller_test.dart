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
  test(
    'tracking controller stores symptoms and can start/end a cycle',
    () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await container.read(trackingControllerProvider.future);

      await container
          .read(trackingControllerProvider.notifier)
          .saveSymptomEntry(
            SymptomDraft(
              loggedAt: DateTime(2026, 3, 29),
              painSeverity: SymptomSeverity.mild,
              acneSeverity: SymptomSeverity.none,
              mood: WellbeingScale.good,
              energy: WellbeingScale.steady,
              sleepQuality: WellbeingScale.good,
              notes: 'Felt more stable today.',
            ),
          );
      final started = await container
          .read(trackingControllerProvider.notifier)
          .startCycle(startDate: DateTime(2026, 3, 29));
      final ended = await container
          .read(trackingControllerProvider.notifier)
          .endCycle(endDate: DateTime(2026, 4, 2));

      final state = await container.read(trackingControllerProvider.future);
      expect(started, isTrue);
      expect(ended, isTrue);
      expect(state.snapshot.latestSymptom?.notes, 'Felt more stable today.');
      expect(state.snapshot.currentCycle, isNull);
      expect(state.snapshot.latestCycle?.endDate, isNotNull);
    },
  );
}
