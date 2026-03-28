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

  Future<void> addSymptomEntry(SymptomDraft draft) async {
    await _runMutation(
      operation: () => _repository.addSymptomEntry(draft),
      errorMessage: 'Unable to save symptom check-in. Please try again.',
    );
  }

  Future<void> startCycleToday() async {
    await _runMutation(
      operation: _repository.startCycleToday,
      errorMessage: 'Unable to start cycle entry. Please try again.',
    );
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
