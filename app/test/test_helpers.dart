import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pcos_companion/core/database/app_database.dart';

ProviderContainer createContainer() {
  final database = AppDatabase(NativeDatabase.memory());
  return ProviderContainer(
    overrides: [appDatabaseProvider.overrideWithValue(database)],
  );
}
