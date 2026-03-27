import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/daily_summary_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(dailySummaryProvider);

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'Today',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        _SummaryCard(
          title: 'Medications',
          body:
              '${summary.activeMedicationCount} active · ${summary.nextReminderLabel}',
        ),
        _SummaryCard(
          title: 'Cycle',
          body: summary.cycleDayLabel,
        ),
        _SummaryCard(
          title: 'Habits',
          body: summary.habitHeadline,
        ),
        _SummaryCard(
          title: 'Symptoms',
          body: summary.symptomHeadline,
        ),
        _SummaryCard(
          title: 'Evidence tip',
          body: summary.evidenceTip,
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(body),
          ],
        ),
      ),
    );
  }
}

