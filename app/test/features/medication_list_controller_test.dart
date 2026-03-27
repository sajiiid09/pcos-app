import 'package:flutter_test/flutter_test.dart';
import 'package:pcos_companion/core/domain/app_types.dart';
import 'package:pcos_companion/features/meds/application/medication_list_state.dart';

import '../test_helpers.dart';

void main() {
  test('medication controller adds and logs medication', () async {
    final container = createContainer();
    addTearDown(container.dispose);

    await container.read(medicationListControllerProvider.future);

    await container
        .read(medicationListControllerProvider.notifier)
        .addMedication(
          const MedicationDraft(
            name: 'Myo-inositol',
            dosage: '2 g',
            frequency: 'Twice daily',
          ),
        );

    final stateAfterAdd =
        await container.read(medicationListControllerProvider.future);
    expect(stateAfterAdd.items.any((item) => item.name == 'Myo-inositol'), isTrue);

    final medicationId =
        stateAfterAdd.items.firstWhere((item) => item.name == 'Myo-inositol').id;
    await container
        .read(medicationListControllerProvider.notifier)
        .logMedication(medicationId, MedicationLogStatus.taken);

    final stateAfterLog =
        await container.read(medicationListControllerProvider.future);
    final item =
        stateAfterLog.items.firstWhere((entry) => entry.id == medicationId);
    expect(item.lastStatus, MedicationLogStatus.taken);
  });
}

