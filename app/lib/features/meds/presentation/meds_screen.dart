import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/app_types.dart';
import '../../../core/domain/input_validation.dart';
import '../application/medication_list_state.dart';

class MedsScreen extends ConsumerStatefulWidget {
  const MedsScreen({super.key});

  @override
  ConsumerState<MedsScreen> createState() => _MedsScreenState();
}

class _MedsScreenState extends ConsumerState<MedsScreen> {
  final _nameController = TextEditingController();
  final _dosageController = TextEditingController(text: '500 mg');
  final _frequencyController = TextEditingController(text: 'Once daily');
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    _frequencyController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final medicationState = ref.watch(medicationListControllerProvider);

    ref.listen(medicationListControllerProvider, (previous, next) {
      final previousMessage = previous?.value?.errorMessage;
      final currentMessage = next.value?.errorMessage;
      if (currentMessage != null && currentMessage != previousMessage) {
        _showMessage(currentMessage);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Medications')),
      body: medicationState.when(
        data: (state) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Medication organizer',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Medication name'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _dosageController,
              decoration: const InputDecoration(labelText: 'Dosage'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _frequencyController,
              decoration: const InputDecoration(labelText: 'Frequency'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'Notes'),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: state.isSaving ? null : _saveMedication,
              child: const Text('Add medication'),
            ),
            if (state.errorMessage != null) ...[
              const SizedBox(height: 12),
              Text(
                state.errorMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
            const SizedBox(height: 24),
            ...state.items.map(
              (item) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 6),
                      Text('${item.dosage} · ${item.frequency}'),
                      const SizedBox(height: 6),
                      Text(item.lastStatusLabel),
                      if ((item.notes ?? '').isNotEmpty) ...[
                        const SizedBox(height: 6),
                        Text(item.notes!),
                      ],
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: FilledButton.tonal(
                              onPressed: () => _logStatus(
                                item.id,
                                MedicationLogStatus.taken,
                              ),
                              child: const Text('Taken'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => _logStatus(
                                item.id,
                                MedicationLogStatus.skipped,
                              ),
                              child: const Text('Skipped'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Failed to load medications: $error')),
      ),
    );
  }

  Future<void> _saveMedication() async {
    final name = _nameController.text.trim();
    final nameError = InputValidation.requiredText(
      name,
      fieldName: 'Medication name',
      maxLength: 80,
    );
    final dosageError = InputValidation.requiredText(
      _dosageController.text,
      fieldName: 'Dosage',
      maxLength: 40,
    );
    final frequencyError = InputValidation.requiredText(
      _frequencyController.text,
      fieldName: 'Frequency',
      maxLength: 40,
    );

    final firstError = nameError ?? dosageError ?? frequencyError;
    if (firstError != null) {
      _showMessage(firstError);
      return;
    }

    await ref.read(medicationListControllerProvider.notifier).addMedication(
          MedicationDraft(
            name: name,
            dosage: _dosageController.text.trim(),
            frequency: _frequencyController.text.trim(),
            notes: _notesController.text.trim(),
          ),
        );

    _nameController.clear();
    _notesController.clear();
  }

  Future<void> _logStatus(
    String medicationId,
    MedicationLogStatus status,
  ) async {
    await ref
        .read(medicationListControllerProvider.notifier)
        .logMedication(medicationId, status);
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

