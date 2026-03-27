import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/app_types.dart';
import '../data/medication_repository.dart';

final medicationListControllerProvider = AsyncNotifierProvider<
    MedicationListController, MedicationListState>(MedicationListController.new);

class MedicationListController extends AsyncNotifier<MedicationListState> {
  MedicationRepository get _repository => ref.read(medicationRepositoryProvider);

  @override
  Future<MedicationListState> build() async {
    return _load();
  }

  Future<void> addMedication(MedicationDraft draft) async {
    final current = state.value ?? MedicationListState.initial();
    state = AsyncData(current.copyWith(isSaving: true));
    await _repository.addMedication(draft);
    state = AsyncData(await _load());
  }

  Future<void> logMedication(
    String medicationId,
    MedicationLogStatus statusValue,
  ) async {
    final current = state.value ?? MedicationListState.initial();
    state = AsyncData(current.copyWith(isSaving: true));
    await _repository.logMedication(
      medicationId: medicationId,
      status: statusValue,
    );
    state = AsyncData(await _load());
  }

  Future<MedicationListState> _load() async {
    final items = await _repository.fetchMedicationItems();
    return MedicationListState(items: items);
  }
}
