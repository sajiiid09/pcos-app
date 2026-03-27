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

    return bootstrap.when(
      data: (_) => MaterialApp.router(
        title: 'PCOS Companion',
        theme: AppTheme.light(),
        debugShowCheckedModeBanner: false,
        routerConfig: ref.watch(appRouterProvider),
      ),
      loading: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        home: const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (error, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        home: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'App bootstrap failed: $error',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

