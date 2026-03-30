import 'package:flutter/material.dart';

import '../../../core/presentation/placeholder_screen.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Learn',
      message:
          'The evidence library can come after the onboarding and tracking flow is solid.',
    );
  }
}
