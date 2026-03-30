import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/app_types.dart';

final evidenceArticlesProvider = Provider<List<EvidenceArticle>>((ref) {
  return const [
    EvidenceArticle(
      slug: 'what-is-pcos',
      title: 'What is PCOS?',
      summary:
          'PCOS is a long-term condition that affects cycles, hormones, and metabolism.',
      body:
          'Lifestyle support, symptom tracking, and clinician guidance are the safest starting points for self-management.',
      category: 'Basics',
    ),
    EvidenceArticle(
      slug: 'food-myths',
      title: 'Food myths vs evidence',
      summary:
          'No single diet has clear evidence of being best for everyone with PCOS.',
      body:
          'Consistent meals, protein, fiber, and a pattern you can sustain usually matter more than chasing a perfect diet label.',
      category: 'Lifestyle',
    ),
    EvidenceArticle(
      slug: 'when-to-talk-to-doctor',
      title: 'When to talk to your doctor',
      summary:
          'Escalating pain, missed periods, or medication issues should be reviewed with a clinician.',
      body:
          'Use the report summary to bring patterns, questions, and adherence issues into your appointment.',
      category: 'Care',
    ),
  ];
});
