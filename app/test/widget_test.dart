import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pcos_companion/app/app.dart';
import 'package:pcos_companion/core/database/app_database.dart';
import 'package:pcos_companion/core/notifications/notification_service.dart';

void main() {
  testWidgets('app boots into the five-tab shell', (tester) async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(database),
          notificationServiceProvider.overrideWithValue(_TestNotificationService()),
        ],
        child: const PcosApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Today'), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.monitor_heart_outlined), findsOneWidget);
    expect(find.byIcon(Icons.medication_outlined), findsOneWidget);
    expect(find.byIcon(Icons.menu_book_outlined), findsOneWidget);
    expect(find.byIcon(Icons.summarize_outlined), findsOneWidget);

    await tester.tap(find.byIcon(Icons.monitor_heart_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Cycle and symptom tracker'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.summarize_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Doctor summary preview'), findsOneWidget);
  });
}

class _TestNotificationService implements AppNotificationService {
  @override
  Future<void> initialize() async {}

  @override
  Future<void> scheduleMedicationReminder({
    required String title,
    required String body,
  }) async {}
}
