import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/app_types.dart';
import '../data/tracking_repository.dart';

final trackingControllerProvider =
    AsyncNotifierProvider<TrackingController, TrackingState>(
      TrackingController.new,
    );

class TrackingController extends AsyncNotifier<TrackingState> {
  TrackingRepository get _repository => ref.read(trackingRepositoryProvider);

  @override
  Future<TrackingState> build() async {
    return _load();
  }

  Future<void> saveSymptomEntry(SymptomDraft draft) async {
    final current = state.value ?? TrackingState.initial();
    state = AsyncData(current.copyWith(isSaving: true));
    await _repository.saveSymptomEntry(draft);
    state = AsyncData(await _load());
  }

  Future<bool> startCycle({
    required DateTime startDate,
    FlowLevel? flowLevel,
    String notes = '',
  }) async {
    final current = state.value ?? TrackingState.initial();
    state = AsyncData(current.copyWith(isSaving: true));
    final created = await _repository.startCycle(
      startDate: startDate,
      flowLevel: flowLevel,
      notes: notes,
    );
    state = AsyncData(await _load());
    return created;
  }

  Future<bool> endCycle({
    required DateTime endDate,
    FlowLevel? flowLevel,
    String notes = '',
  }) async {
    final current = state.value ?? TrackingState.initial();
    state = AsyncData(current.copyWith(isSaving: true));
    final ended = await _repository.endCycle(
      endDate: endDate,
      flowLevel: flowLevel,
      notes: notes,
    );
    state = AsyncData(await _load());
    return ended;
  }

  Future<void> addHabitLog(HabitDraft draft) async {
    await _runMutation(
      operation: () => _repository.addHabitLog(draft),
      errorMessage: 'Unable to save habit log. Please try again.',
    );
  }

  Future<void> _runMutation({
    required Future<void> Function() operation,
    required String errorMessage,
  }) async {
    final current = state.value ?? TrackingState.initial();
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

  Future<TrackingState> _load() async {
    final snapshot = await _repository.fetchSnapshot();
    return TrackingState(snapshot: snapshot);
  }
}
