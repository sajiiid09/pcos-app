import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/app_types.dart';
import '../data/medication_repository.dart';

final medicationListControllerProvider =
    AsyncNotifierProvider<MedicationListController, MedicationListState>(
      MedicationListController.new,
    );

class MedicationListController extends AsyncNotifier<MedicationListState> {
  MedicationRepository get _repository =>
      ref.read(medicationRepositoryProvider);

  @override
  Future<MedicationListState> build() async {
    return _load();
  }

  Future<void> addMedication(MedicationDraft draft) async {
    await _runMutation(
      operation: () => _repository.addMedication(draft),
      errorMessage: 'Unable to save medication. Please try again.',
    );
  }

  Future<void> logMedication(
    String medicationId,
    MedicationLogStatus statusValue,
  ) async {
    await _runMutation(
      operation: () => _repository.logMedication(
        medicationId: medicationId,
        status: statusValue,
      ),
      errorMessage: 'Unable to update medication log. Please try again.',
    );
  }

  Future<void> _runMutation({
    required Future<void> Function() operation,
    required String errorMessage,
  }) async {
    final current = state.value ?? MedicationListState.initial();
    state = AsyncData(current.copyWith(isSaving: true, clearError: true));
    try {
      await operation();
      state = AsyncData(await _load());
    } catch (_) {
      state = AsyncData(
        current.copyWith(
          isSaving: false,
          errorMessage: errorMessage,
          clearError: false,
        ),
      );
    }
  }

  Future<MedicationListState> _load() async {
    final items = await _repository.fetchMedicationItems();
    return MedicationListState(items: items);
  }
}
