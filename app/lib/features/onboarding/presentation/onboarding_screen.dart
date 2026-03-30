import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/domain/app_types.dart';
import '../application/onboarding_controller.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  AgeRange _ageRange = AgeRange.age25To34;
  DiagnosisLabel _diagnosisLabel = DiagnosisLabel.pcos;
  PrimaryGoal _primaryGoal = PrimaryGoal.improveSymptoms;
  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      'Welcome',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Tell us a little about you so the app can start with a useful dashboard.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your name.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<AgeRange>(
                      initialValue: _ageRange,
                      decoration: const InputDecoration(labelText: 'Age range'),
                      items: AgeRange.values
                          .map(
                            (value) => DropdownMenuItem(
                              value: value,
                              child: Text(value.label),
                            ),
                          )
                          .toList(),
                      onChanged: (value) => setState(() => _ageRange = value!),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<DiagnosisLabel>(
                      initialValue: _diagnosisLabel,
                      decoration: const InputDecoration(
                        labelText: 'Diagnosis status',
                      ),
                      items: DiagnosisLabel.values
                          .map(
                            (value) => DropdownMenuItem(
                              value: value,
                              child: Text(value.label),
                            ),
                          )
                          .toList(),
                      onChanged: (value) =>
                          setState(() => _diagnosisLabel = value!),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<PrimaryGoal>(
                      initialValue: _primaryGoal,
                      decoration: const InputDecoration(labelText: 'Main goal'),
                      items: PrimaryGoal.values
                          .map(
                            (value) => DropdownMenuItem(
                              value: value,
                              child: Text(value.label),
                            ),
                          )
                          .toList(),
                      onChanged: (value) =>
                          setState(() => _primaryGoal = value!),
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: _isSaving ? null : _submit,
                      child: Text(_isSaving ? 'Saving...' : 'Continue'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSaving = true);
    await ref
        .read(onboardingControllerProvider.notifier)
        .saveProfile(
          UserProfileDraft(
            name: _nameController.text.trim(),
            ageRange: _ageRange,
            diagnosisLabel: _diagnosisLabel,
            primaryGoal: _primaryGoal,
          ),
        );
    if (!mounted) {
      return;
    }

    setState(() => _isSaving = false);
    context.go('/home');
  }
}
