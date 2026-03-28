import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/domain/app_types.dart';
import '../../track/application/tracking_state.dart';
import '../application/home_dashboard_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(homeDashboardProvider);
    final trackingState =
        ref.watch(trackingControllerProvider).value ?? TrackingState.initial();

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          dashboard.greeting,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(
          dashboard.dateLabel,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        Text('Primary goal: ${dashboard.primaryGoalLabel}'),
        const SizedBox(height: 20),
        _SummaryCard(
          title: 'Latest symptom entry',
          body: dashboard.latestSymptomSummary,
        ),
        _SummaryCard(title: 'Cycle status', body: dashboard.cycleStatus),
        const SizedBox(height: 12),
        Text('Quick actions', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        FilledButton.icon(
          onPressed: () => context.go('/track'),
          icon: const Icon(Icons.edit_note),
          label: const Text('Log symptoms'),
        ),
        const SizedBox(height: 12),
        FilledButton.tonalIcon(
          onPressed: trackingState.isSaving || dashboard.hasActiveCycle
              ? null
              : () => _startPeriod(context, ref),
          icon: const Icon(Icons.play_circle_outline),
          label: const Text('Start period'),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: trackingState.isSaving || !dashboard.hasActiveCycle
              ? null
              : () => _endPeriod(context, ref),
          icon: const Icon(Icons.stop_circle_outlined),
          label: const Text('End period'),
        ),
      ],
    );
  }

  Future<void> _startPeriod(BuildContext context, WidgetRef ref) async {
    await ref
        .read(trackingControllerProvider.notifier)
        .startCycle(startDate: DateTime.now());
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Period started.')));
    }
  }

  Future<void> _endPeriod(BuildContext context, WidgetRef ref) async {
    final ended = await ref
        .read(trackingControllerProvider.notifier)
        .endCycle(endDate: DateTime.now());
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(ended ? 'Period ended.' : 'No active period to end.'),
        ),
      );
    }
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
