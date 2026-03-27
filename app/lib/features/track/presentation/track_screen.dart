import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/app_types.dart';
import '../application/tracking_state.dart';

class TrackScreen extends ConsumerStatefulWidget {
  const TrackScreen({super.key});

  @override
  ConsumerState<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends ConsumerState<TrackScreen> {
  final _symptomNotesController = TextEditingController();
  final _movementController = TextEditingController(text: '20');
  final _hydrationController = TextEditingController(text: '6');
  final _sleepController = TextEditingController(text: '7.5');

  SymptomSeverity _painSeverity = SymptomSeverity.moderate;
  final SymptomSeverity _acneSeverity = SymptomSeverity.mild;
  WellbeingScale _mood = WellbeingScale.steady;
  WellbeingScale _energy = WellbeingScale.low;
  final WellbeingScale _sleepQuality = WellbeingScale.steady;
  WellbeingScale _stress = WellbeingScale.steady;

  @override
  void dispose() {
    _symptomNotesController.dispose();
    _movementController.dispose();
    _hydrationController.dispose();
    _sleepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trackingState = ref.watch(trackingControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Track')),
      body: trackingState.when(
        data: (state) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Cycle and symptom tracker',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<SymptomSeverity>(
              initialValue: _painSeverity,
              decoration: const InputDecoration(labelText: 'Pain'),
              items: SymptomSeverity.values
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(value.label),
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() => _painSeverity = value!),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<WellbeingScale>(
              initialValue: _mood,
              decoration: const InputDecoration(labelText: 'Mood'),
              items: WellbeingScale.values
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(value.label),
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() => _mood = value!),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<WellbeingScale>(
              initialValue: _energy,
              decoration: const InputDecoration(labelText: 'Energy'),
              items: WellbeingScale.values
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(value.label),
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() => _energy = value!),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _symptomNotesController,
              decoration: const InputDecoration(labelText: 'Notes'),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: state.isSaving ? null : _logSymptom,
              child: const Text('Save symptom check-in'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: state.isSaving ? null : _startCycle,
              child: const Text('Start cycle today'),
            ),
            const SizedBox(height: 24),
            Text(
              'Lifestyle log',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _movementController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Movement minutes'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _hydrationController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Hydration glasses'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _sleepController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Sleep hours'),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<WellbeingScale>(
              initialValue: _stress,
              decoration: const InputDecoration(labelText: 'Stress'),
              items: WellbeingScale.values
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(value.label),
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() => _stress = value!),
            ),
            const SizedBox(height: 12),
            FilledButton.tonal(
              onPressed: state.isSaving ? null : _logHabit,
              child: const Text('Save habit log'),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Latest snapshot',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      state.snapshot.latestCycle == null
                          ? 'Cycle: none'
                          : 'Cycle: ${formatCompactDate(state.snapshot.latestCycle!.startDate)}',
                    ),
                    Text(
                      state.snapshot.latestSymptom == null
                          ? 'Symptom: none'
                          : 'Symptom pain: ${state.snapshot.latestSymptom!.painSeverity.label}',
                    ),
                    Text(
                      state.snapshot.latestHabit == null
                          ? 'Habit: none'
                          : 'Movement: ${state.snapshot.latestHabit!.movementMinutes} min',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Failed to load tracker: $error')),
      ),
    );
  }

  Future<void> _logSymptom() async {
    await ref.read(trackingControllerProvider.notifier).addSymptomEntry(
          SymptomDraft(
            painSeverity: _painSeverity,
            acneSeverity: _acneSeverity,
            mood: _mood,
            energy: _energy,
            sleepQuality: _sleepQuality,
            notes: _symptomNotesController.text.trim(),
          ),
        );
    _symptomNotesController.clear();
  }

  Future<void> _startCycle() async {
    await ref.read(trackingControllerProvider.notifier).startCycleToday();
  }

  Future<void> _logHabit() async {
    final movement = int.tryParse(_movementController.text) ?? 0;
    final hydration = int.tryParse(_hydrationController.text) ?? 0;
    final sleep = double.tryParse(_sleepController.text) ?? 0;

    await ref.read(trackingControllerProvider.notifier).addHabitLog(
          HabitDraft(
            movementMinutes: movement,
            hydrationGlasses: hydration,
            sleepHours: sleep,
            stressLevel: _stress,
          ),
        );
  }
}
