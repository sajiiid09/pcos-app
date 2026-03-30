import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/domain/app_types.dart';
import '../../../core/domain/input_validation.dart';
import '../application/tracking_state.dart';

class TrackScreen extends ConsumerStatefulWidget {
  const TrackScreen({super.key});

  @override
  ConsumerState<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends ConsumerState<TrackScreen> {
  final _formKey = GlobalKey<FormState>();
  final _notesController = TextEditingController();

  DateTime _selectedDate = dateOnly(DateTime.now());
  double _painLevel = 2;
  SymptomSeverity _acneSeverity = SymptomSeverity.mild;
  WellbeingScale _mood = WellbeingScale.steady;
  WellbeingScale _energy = WellbeingScale.steady;
  WellbeingScale _sleepQuality = WellbeingScale.steady;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trackingState = ref.watch(trackingControllerProvider);
    final currentCycle = trackingState.value?.snapshot.currentCycle;

    ref.listen(trackingControllerProvider, (previous, next) {
      final previousMessage = previous?.value?.errorMessage;
      final currentMessage = next.value?.errorMessage;
      if (currentMessage != null && currentMessage != previousMessage) {
        _showMessage(currentMessage);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Track')),
      body: trackingState.when(
        data: (state) => Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(
                'Log today’s symptoms',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _pickDate,
                icon: const Icon(Icons.calendar_today_outlined),
                label: Text('Date: ${formatCompactDate(_selectedDate)}'),
              ),
              const SizedBox(height: 20),
              Text('Pain level: ${_painLevel.round()}'),
              Slider(
                value: _painLevel,
                divisions: 3,
                min: 0,
                max: 3,
                label: SymptomSeverity.values[_painLevel.round()].label,
                onChanged: state.isSaving
                    ? null
                    : (value) => setState(() => _painLevel = value),
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
                onChanged: state.isSaving
                    ? null
                    : (value) => setState(() => _mood = value!),
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
                onChanged: state.isSaving
                    ? null
                    : (value) => setState(() => _energy = value!),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<WellbeingScale>(
                initialValue: _sleepQuality,
                decoration: const InputDecoration(labelText: 'Sleep quality'),
                items: WellbeingScale.values
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.label),
                      ),
                    )
                    .toList(),
                onChanged: state.isSaving
                    ? null
                    : (value) => setState(() => _sleepQuality = value!),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<SymptomSeverity>(
                initialValue: _acneSeverity,
                decoration: const InputDecoration(labelText: 'Acne severity'),
                items: SymptomSeverity.values
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value.label),
                      ),
                    )
                    .toList(),
                onChanged: state.isSaving
                    ? null
                    : (value) => setState(() => _acneSeverity = value!),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _notesController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Notes (optional)',
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: state.isSaving ? null : _saveSymptom,
                child: const Text('Save entry'),
              ),
              const SizedBox(height: 24),
              Text(
                'Cycle actions',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Text(
                currentCycle == null
                    ? 'No active period.'
                    : 'Current period started ${formatCompactDate(currentCycle.startDate)}.',
              ),
              const SizedBox(height: 12),
              FilledButton.tonal(
                onPressed: state.isSaving || currentCycle != null
                    ? null
                    : _startCycle,
                child: const Text('Start period'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: state.isSaving || currentCycle == null
                    ? null
                    : _endCycle,
                child: const Text('End period'),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) =>
            Center(child: Text('Failed to load tracker: $error')),
      ),
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _selectedDate = dateOnly(picked));
    }
  }

  Future<void> _saveSymptom() async {
    await ref
        .read(trackingControllerProvider.notifier)
        .saveSymptomEntry(
          SymptomDraft(
            loggedAt: _selectedDate,
            painSeverity: SymptomSeverity.values[_painLevel.round()],
            acneSeverity: _acneSeverity,
            mood: _mood,
            energy: _energy,
            sleepQuality: _sleepQuality,
            notes: _notesController.text.trim(),
          ),
        );
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Symptom entry saved.')));
    context.go('/home');
  }

  Future<void> _startCycle() async {
    final started = await ref
        .read(trackingControllerProvider.notifier)
        .startCycle(startDate: _selectedDate);
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          started ? 'Period started.' : 'A period is already active.',
        ),
      ),
    );
    if (started) {
      context.go('/home');
    }
  }

  Future<void> _endCycle() async {
    final ended = await ref
        .read(trackingControllerProvider.notifier)
        .endCycle(endDate: _selectedDate);
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(ended ? 'Period ended.' : 'No active period to end.'),
      ),
    );
    if (ended) {
      context.go('/home');
    }
  }

  void _showMessage(String message) {
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
