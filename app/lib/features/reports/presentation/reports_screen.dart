import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../application/report_preview_controller.dart';

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportPreview = ref.watch(reportPreviewControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: reportPreview.when(
        data: (report) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Doctor summary preview',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Generated ${DateFormat('MMM d, h:mm a').format(report.generatedAt)}',
                    ),
                    const SizedBox(height: 8),
                    Text('Active medications: ${report.activeMedicationCount}'),
                    Text(
                      'Adherence: ${report.adherenceRate.toStringAsFixed(0)}%',
                    ),
                    const SizedBox(height: 12),
                    Text(report.cycleSummary),
                    const SizedBox(height: 8),
                    Text(report.symptomSummary),
                    const SizedBox(height: 8),
                    Text(report.lifestyleSummary),
                    const SizedBox(height: 12),
                    Text(
                      'Questions for your visit',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ...report.questionsForDoctor.map(
                      (question) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text('• $question'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () =>
                  ref.read(reportPreviewControllerProvider.notifier).refresh(),
              child: const Text('Refresh preview'),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) =>
            Center(child: Text('Failed to build report: $error')),
      ),
    );
  }
}
