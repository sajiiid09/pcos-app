import 'package:drift/drift.dart' show Value;
import 'package:intl/intl.dart';

enum SymptomSeverity { none, mild, moderate, severe }

enum MedicationLogStatus { taken, skipped }

enum HabitType { movement, hydration, sleep, stress, mealBalance }

enum WellbeingScale { veryLow, low, steady, good, great }

enum AgeRange { under18, age18To24, age25To34, age35To44, age45Plus }

enum DiagnosisLabel { pcos, pcod, unsure }

enum PrimaryGoal {
  regulateCycle,
  loseWeight,
  improveSymptoms,
  trackMedications,
  generalWellness,
}

enum FlowLevel { light, medium, heavy }

extension SymptomSeverityX on SymptomSeverity {
  String get label => switch (this) {
    SymptomSeverity.none => 'None',
    SymptomSeverity.mild => 'Mild',
    SymptomSeverity.moderate => 'Moderate',
    SymptomSeverity.severe => 'Severe',
  };
}

extension MedicationLogStatusX on MedicationLogStatus {
  String get label => switch (this) {
    MedicationLogStatus.taken => 'Taken',
    MedicationLogStatus.skipped => 'Skipped',
  };
}

extension WellbeingScaleX on WellbeingScale {
  String get label => switch (this) {
    WellbeingScale.veryLow => 'Very low',
    WellbeingScale.low => 'Low',
    WellbeingScale.steady => 'Steady',
    WellbeingScale.good => 'Good',
    WellbeingScale.great => 'Great',
  };
}

extension AgeRangeX on AgeRange {
  String get label => switch (this) {
    AgeRange.under18 => 'Under 18',
    AgeRange.age18To24 => '18 to 24',
    AgeRange.age25To34 => '25 to 34',
    AgeRange.age35To44 => '35 to 44',
    AgeRange.age45Plus => '45+',
  };
}

extension DiagnosisLabelX on DiagnosisLabel {
  String get label => switch (this) {
    DiagnosisLabel.pcos => 'PCOS',
    DiagnosisLabel.pcod => 'PCOD',
    DiagnosisLabel.unsure => 'Unsure',
  };
}

extension PrimaryGoalX on PrimaryGoal {
  String get label => switch (this) {
    PrimaryGoal.regulateCycle => 'Regulate cycle',
    PrimaryGoal.loseWeight => 'Lose weight',
    PrimaryGoal.improveSymptoms => 'Improve symptoms',
    PrimaryGoal.trackMedications => 'Track medications',
    PrimaryGoal.generalWellness => 'General wellness',
  };
}

extension FlowLevelX on FlowLevel {
  String get label => switch (this) {
    FlowLevel.light => 'Light',
    FlowLevel.medium => 'Medium',
    FlowLevel.heavy => 'Heavy',
  };
}

class UserProfileDraft {
  const UserProfileDraft({
    required this.name,
    required this.ageRange,
    required this.diagnosisLabel,
    required this.primaryGoal,
  });

  final String name;
  final AgeRange ageRange;
  final DiagnosisLabel diagnosisLabel;
  final PrimaryGoal primaryGoal;
}

class UserProfileRecord {
  const UserProfileRecord({
    required this.id,
    required this.name,
    required this.ageRange,
    required this.diagnosisLabel,
    required this.primaryGoal,
    required this.createdAt,
  });

  final String id;
  final String name;
  final AgeRange ageRange;
  final DiagnosisLabel diagnosisLabel;
  final PrimaryGoal primaryGoal;
  final DateTime createdAt;
}

class MedicationDraft {
  const MedicationDraft({
    required this.name,
    required this.dosage,
    required this.frequency,
    this.notes = '',
  });

  final String name;
  final String dosage;
  final String frequency;
  final String notes;
}

class SymptomDraft {
  const SymptomDraft({
    required this.loggedAt,
    required this.painSeverity,
    required this.acneSeverity,
    required this.mood,
    required this.energy,
    required this.sleepQuality,
    this.notes = '',
  });

  final DateTime loggedAt;
  final SymptomSeverity painSeverity;
  final SymptomSeverity acneSeverity;
  final WellbeingScale mood;
  final WellbeingScale energy;
  final WellbeingScale sleepQuality;
  final String notes;
}

class HabitDraft {
  const HabitDraft({
    required this.movementMinutes,
    required this.hydrationGlasses,
    required this.sleepHours,
    required this.stressLevel,
  });

  final int movementMinutes;
  final int hydrationGlasses;
  final double sleepHours;
  final WellbeingScale stressLevel;
}

class MedicationListItem {
  const MedicationListItem({
    required this.id,
    required this.name,
    required this.dosage,
    required this.frequency,
    this.notes,
    this.lastStatus,
    this.lastLoggedAt,
  });

  final String id;
  final String name;
  final String dosage;
  final String frequency;
  final String? notes;
  final MedicationLogStatus? lastStatus;
  final DateTime? lastLoggedAt;

  String get lastStatusLabel {
    if (lastStatus == null || lastLoggedAt == null) {
      return 'No doses logged yet';
    }

    return '${lastStatus!.label} ${DateFormat('MMM d, h:mm a').format(lastLoggedAt!)}';
  }
}

class CycleEntryRecord {
  const CycleEntryRecord({
    required this.id,
    required this.startDate,
    this.endDate,
    this.flowLevel,
    this.notes,
  });

  final String id;
  final DateTime startDate;
  final DateTime? endDate;
  final FlowLevel? flowLevel;
  final String? notes;

  bool get isActive => endDate == null;
}

class SymptomEntryRecord {
  const SymptomEntryRecord({
    required this.id,
    required this.loggedAt,
    required this.painSeverity,
    required this.acneSeverity,
    required this.mood,
    required this.energy,
    required this.sleepQuality,
    this.notes,
  });

  final String id;
  final DateTime loggedAt;
  final SymptomSeverity painSeverity;
  final SymptomSeverity acneSeverity;
  final WellbeingScale mood;
  final WellbeingScale energy;
  final WellbeingScale sleepQuality;
  final String? notes;
}

class HabitLogRecord {
  const HabitLogRecord({
    required this.id,
    required this.loggedAt,
    required this.movementMinutes,
    required this.hydrationGlasses,
    required this.sleepHours,
    required this.stressLevel,
  });

  final String id;
  final DateTime loggedAt;
  final int movementMinutes;
  final int hydrationGlasses;
  final double sleepHours;
  final WellbeingScale stressLevel;
}

class TrackingSnapshot {
  const TrackingSnapshot({
    this.currentCycle,
    this.latestCycle,
    this.latestSymptom,
    this.latestHabit,
  });

  final CycleEntryRecord? currentCycle;
  final CycleEntryRecord? latestCycle;
  final SymptomEntryRecord? latestSymptom;
  final HabitLogRecord? latestHabit;
}

class HomeDashboardState {
  const HomeDashboardState({
    required this.greeting,
    required this.dateLabel,
    required this.primaryGoalLabel,
    required this.latestSymptomSummary,
    required this.cycleStatus,
    required this.hasActiveCycle,
  });

  final String greeting;
  final String dateLabel;
  final String primaryGoalLabel;
  final String latestSymptomSummary;
  final String cycleStatus;
  final bool hasActiveCycle;
}

class DoctorSummaryPreview {
  const DoctorSummaryPreview({
    required this.generatedAt,
    required this.activeMedicationCount,
    required this.adherenceRate,
    required this.cycleSummary,
    required this.symptomSummary,
    required this.lifestyleSummary,
    required this.questionsForDoctor,
  });

  final DateTime generatedAt;
  final int activeMedicationCount;
  final double adherenceRate;
  final String cycleSummary;
  final String symptomSummary;
  final String lifestyleSummary;
  final List<String> questionsForDoctor;
}

class EvidenceArticle {
  const EvidenceArticle({
    required this.slug,
    required this.title,
    required this.summary,
    required this.body,
    required this.category,
  });

  final String slug;
  final String title;
  final String summary;
  final String body;
  final String category;
}

class MedicationListState {
  const MedicationListState({required this.items, this.isSaving = false});

  final List<MedicationListItem> items;
  final bool isSaving;

  factory MedicationListState.initial() => const MedicationListState(items: []);

  MedicationListState copyWith({
    List<MedicationListItem>? items,
    bool? isSaving,
  }) {
    return MedicationListState(
      items: items ?? this.items,
      isSaving: isSaving ?? this.isSaving,
    );
  }
}

class TrackingState {
  const TrackingState({required this.snapshot, this.isSaving = false});

  final TrackingSnapshot snapshot;
  final bool isSaving;

  factory TrackingState.initial() =>
      const TrackingState(snapshot: TrackingSnapshot());

  TrackingState copyWith({TrackingSnapshot? snapshot, bool? isSaving}) {
    return TrackingState(
      snapshot: snapshot ?? this.snapshot,
      isSaving: isSaving ?? this.isSaving,
    );
  }
}

DateTime dateOnly(DateTime value) =>
    DateTime(value.year, value.month, value.day);

String formatCompactDate(DateTime value) => DateFormat('MMM d').format(value);

String formatFullDate(DateTime value) =>
    DateFormat('EEEE, MMM d').format(value);

String formatCompactDateTime(DateTime value) =>
    DateFormat('MMM d, h:mm a').format(value);

extension OptionalStringValue on String {
  Value<String?> asNullableValue() {
    final normalized = trim();
    return Value(normalized.isEmpty ? null : normalized);
  }
}
