from datetime import UTC, datetime

from ..schemas.reports import DoctorSummaryPreviewRequest, DoctorSummaryPreviewResponse


class ReportPreviewService:
  def build_preview(
      self,
      payload: DoctorSummaryPreviewRequest,
  ) -> DoctorSummaryPreviewResponse:
    taken_count = sum(1 for item in payload.medications if item.status == "taken")
    adherence_rate = (
        0.0
        if not payload.medications
        else (taken_count / len(payload.medications)) * 100.0
    )

    latest_cycle = payload.cycles[-1] if payload.cycles else None
    latest_symptom = payload.symptoms[-1] if payload.symptoms else None
    latest_habit = payload.habits[-1] if payload.habits else None

    questions = [
        (
            "Can we simplify my medication plan?"
            if adherence_rate < 80
            else "Are my current medications still appropriate?"
        ),
        "Which symptom changes matter most between visits?",
    ]

    if latest_symptom and latest_symptom.pain_severity == "severe":
      questions.append("What should I do if pain becomes severe again?")

    cycle_summary = (
        "No cycle entries yet."
        if latest_cycle is None
        else f"Latest cycle started on {latest_cycle.start_date.date().isoformat()}."
    )
    symptom_summary = (
        "No symptom check-ins yet."
        if latest_symptom is None
        else (
            f"Pain is {latest_symptom.pain_severity}, mood is {latest_symptom.mood}, "
            f"and energy is {latest_symptom.energy}."
        )
    )
    lifestyle_summary = (
        "No habit logs yet."
        if latest_habit is None
        else (
            f"{latest_habit.movement_minutes} minutes of movement, "
            f"{latest_habit.hydration_glasses} glasses of water, "
            f"and {latest_habit.sleep_hours:.1f} hours of sleep."
        )
    )

    return DoctorSummaryPreviewResponse(
        generated_at=datetime.now(UTC),
        active_medication_count=len({item.medication_name for item in payload.medications}),
        adherence_rate=round(adherence_rate, 2),
        cycle_summary=cycle_summary,
        symptom_summary=symptom_summary,
        lifestyle_summary=lifestyle_summary,
        questions_for_doctor=questions,
    )
