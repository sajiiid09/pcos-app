import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/database/app_database.dart';
import '../core/navigation/app_router.dart';
import '../core/notifications/notification_service.dart';
import '../core/theme/app_theme.dart';

final appBootstrapProvider = FutureProvider<void>((ref) async {
  final notifications = ref.read(notificationServiceProvider);
  await notifications.initialize();
  await ref.read(appDatabaseProvider).seedDemoData();
});

class PcosApp extends ConsumerWidget {
  const PcosApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bootstrap = ref.watch(appBootstrapProvider);

    return MaterialApp.router(
      title: 'PCOS Companion',
      theme: AppTheme.light(),
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(appRouterProvider),
      builder: (context, child) {
        final overlay = <Widget>[];

        if (bootstrap.isLoading) {
          overlay.add(
            const Align(
              alignment: Alignment.topCenter,
              child: LinearProgressIndicator(minHeight: 2),
            ),
          );
        }

        if (bootstrap.hasError) {
          overlay.add(
            Align(
              alignment: Alignment.topCenter,
              child: Material(
                color: Theme.of(context).colorScheme.errorContainer,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Initialization issue: ${bootstrap.error}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        }

        return Stack(
          children: [
            child ?? const SizedBox.shrink(),
            ...overlay,
          ],
        );
      },
    );
  }
}

