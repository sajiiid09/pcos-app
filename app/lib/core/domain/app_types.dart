import 'package:drift/drift.dart' show Value;
import 'package:intl/intl.dart';

enum SymptomSeverity { none, mild, moderate, severe }

enum MedicationLogStatus { taken, skipped }

enum HabitType { movement, hydration, sleep, stress, mealBalance }

enum WellbeingScale { veryLow, low, steady, good, great }

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
    required this.painSeverity,
    required this.acneSeverity,
    required this.mood,
    required this.energy,
    required this.sleepQuality,
    this.notes = '',
  });

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
  });

  final String id;
  final DateTime startDate;
  final DateTime? endDate;
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
    this.latestCycle,
    this.latestSymptom,
    this.latestHabit,
  });

  final CycleEntryRecord? latestCycle;
  final SymptomEntryRecord? latestSymptom;
  final HabitLogRecord? latestHabit;
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

class DailySummaryState {
  const DailySummaryState({
    required this.activeMedicationCount,
    required this.nextReminderLabel,
    required this.cycleDayLabel,
    required this.habitHeadline,
    required this.symptomHeadline,
    required this.evidenceTip,
  });

  final int activeMedicationCount;
  final String nextReminderLabel;
  final String cycleDayLabel;
  final String habitHeadline;
  final String symptomHeadline;
  final String evidenceTip;
}

class MedicationListState {
  const MedicationListState({
    required this.items,
    this.isSaving = false,
    this.errorMessage,
  });

  final List<MedicationListItem> items;
  final bool isSaving;
  final String? errorMessage;

  factory MedicationListState.initial() => const MedicationListState(items: []);

  MedicationListState copyWith({
    List<MedicationListItem>? items,
    bool? isSaving,
    String? errorMessage,
    bool clearError = false,
  }) {
    return MedicationListState(
      items: items ?? this.items,
      isSaving: isSaving ?? this.isSaving,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

class TrackingState {
  const TrackingState({
    required this.snapshot,
    this.isSaving = false,
    this.errorMessage,
  });

  final TrackingSnapshot snapshot;
  final bool isSaving;
  final String? errorMessage;

  factory TrackingState.initial() =>
      const TrackingState(snapshot: TrackingSnapshot());

  TrackingState copyWith({
    TrackingSnapshot? snapshot,
    bool? isSaving,
    String? errorMessage,
    bool clearError = false,
  }) {
    return TrackingState(
      snapshot: snapshot ?? this.snapshot,
      isSaving: isSaving ?? this.isSaving,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

DateTime dateOnly(DateTime value) => DateTime(value.year, value.month, value.day);

String formatCompactDate(DateTime value) => DateFormat('MMM d').format(value);

extension OptionalStringValue on String {
  Value<String?> asNullableValue() {
    final normalized = trim();
    return Value(normalized.isEmpty ? null : normalized);
  }
}
