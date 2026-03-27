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
    final current = state.value ?? TrackingState.initial();
    state = AsyncData(current.copyWith(isSaving: true));
    await _repository.addSymptomEntry(draft);
    state = AsyncData(await _load());
  }

  Future<void> startCycleToday() async {
    final current = state.value ?? TrackingState.initial();
    state = AsyncData(current.copyWith(isSaving: true));
    await _repository.startCycleToday();
    state = AsyncData(await _load());
  }

  Future<void> addHabitLog(HabitDraft draft) async {
    final current = state.value ?? TrackingState.initial();
    state = AsyncData(current.copyWith(isSaving: true));
    await _repository.addHabitLog(draft);
    state = AsyncData(await _load());
  }

  Future<TrackingState> _load() async {
    final snapshot = await _repository.fetchSnapshot();
    return TrackingState(snapshot: snapshot);
  }
}
