import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:pcos_companion/core/domain/app_types.dart';
import 'package:pcos_companion/core/database/app_database.dart';
import 'package:pcos_companion/features/meds/application/medication_list_state.dart';
import 'package:pcos_companion/features/meds/data/medication_repository.dart';

import '../test_helpers.dart';

class _FailingMedicationRepository extends MedicationRepository {
  _FailingMedicationRepository() : super(AppDatabase(NativeDatabase.memory()));

  @override
  Future<void> addMedication(MedicationDraft draft) async {
    throw Exception('write failure');
  }
}

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

  test('medication controller exposes recoverable error state on failure', () async {
    final container = createContainer(
      overrides: [
        medicationRepositoryProvider
            .overrideWithValue(_FailingMedicationRepository()),
      ],
    );
    addTearDown(container.dispose);

    await container.read(medicationListControllerProvider.future);

    await container.read(medicationListControllerProvider.notifier).addMedication(
          const MedicationDraft(
            name: 'Metformin',
            dosage: '500 mg',
            frequency: 'Twice daily',
          ),
        );

    final state = container.read(medicationListControllerProvider).value;
    expect(state, isNotNull);
    expect(state!.errorMessage, isNotNull);
    expect(state.isSaving, isFalse);
  });
}

