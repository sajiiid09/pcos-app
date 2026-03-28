import 'package:flutter/material.dart';

import '../../../core/presentation/placeholder_screen.dart';

class MedsScreen extends StatelessWidget {
  const MedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Meds',
      message:
          'Medication management is intentionally deferred while we finish the first tracking loop.',
    );
  }
}
