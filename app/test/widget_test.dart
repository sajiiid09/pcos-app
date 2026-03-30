import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pcos_companion/app/app.dart';
import 'package:pcos_companion/core/database/app_database.dart';

void main() {
  testWidgets(
    'fresh app goes through onboarding, tracking, and relaunch persistence',
    (tester) async {
      final database = AppDatabase(NativeDatabase.memory());
      addTearDown(database.close);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [appDatabaseProvider.overrideWithValue(database)],
          child: const PcosApp(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Welcome'), findsOneWidget);

      await tester.enterText(find.byType(TextFormField).first, 'Ava');
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text('Hi, Ava'), findsOneWidget);
      expect(find.textContaining('No symptom entry yet'), findsOneWidget);
      expect(find.textContaining('No period logged yet'), findsOneWidget);

      await tester.tap(find.text('Log symptoms'));
      await tester.pumpAndSettle();

      expect(find.text('Log today’s symptoms'), findsOneWidget);

      await tester.scrollUntilVisible(find.text('Save entry'), 300);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Save entry'));
      await tester.pumpAndSettle();

      expect(find.text('Hi, Ava'), findsOneWidget);
      expect(find.textContaining('Last check-in'), findsOneWidget);

      await tester.scrollUntilVisible(find.text('Start period'), 200);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Start period'));
      await tester.pumpAndSettle();
      expect(find.textContaining('Current period started'), findsOneWidget);

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pumpAndSettle();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [appDatabaseProvider.overrideWithValue(database)],
          child: const PcosApp(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Hi, Ava'), findsOneWidget);
      expect(find.textContaining('Last check-in'), findsOneWidget);
      expect(find.textContaining('Current period started'), findsOneWidget);
    },
  );
}
