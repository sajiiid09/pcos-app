import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/app_types.dart';
import '../../../core/presentation/placeholder_screen.dart';
import '../../onboarding/application/onboarding_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(onboardingControllerProvider).value;
    if (profile == null) {
      return const PlaceholderScreen(
        title: 'Profile',
        message: 'Profile setup is still in progress.',
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text('Age range: ${profile.ageRange.label}'),
                  Text('Diagnosis: ${profile.diagnosisLabel.label}'),
                  Text('Primary goal: ${profile.primaryGoal.label}'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Profile editing can come later. Day 2 only needs persistence.',
          ),
        ],
      ),
    );
  }
}
