from datetime import datetime
from typing import Literal

from pydantic import BaseModel, Field

MedicationStatus = Literal["taken", "skipped"]
SymptomSeverity = Literal["none", "mild", "moderate", "severe"]
WellbeingScale = Literal["very_low", "low", "steady", "good", "great"]


class MedicationLogEntry(BaseModel):
  medication_name: str
  dosage: str
  status: MedicationStatus
  logged_at: datetime


class CycleEntryPayload(BaseModel):
  start_date: datetime
  end_date: datetime | None = None


class SymptomEntryPayload(BaseModel):
  logged_at: datetime
  pain_severity: SymptomSeverity
  acne_severity: SymptomSeverity
  mood: WellbeingScale
  energy: WellbeingScale
  sleep_quality: WellbeingScale
  notes: str | None = None


class HabitLogPayload(BaseModel):
  logged_at: datetime
  movement_minutes: int = Field(ge=0)
  hydration_glasses: int = Field(ge=0)
  sleep_hours: float = Field(ge=0)
  stress_level: WellbeingScale


class DoctorSummaryPreviewRequest(BaseModel):
  medications: list[MedicationLogEntry] = Field(default_factory=list)
  cycles: list[CycleEntryPayload] = Field(default_factory=list)
  symptoms: list[SymptomEntryPayload] = Field(default_factory=list)
  habits: list[HabitLogPayload] = Field(default_factory=list)
  user_notes: list[str] = Field(default_factory=list)


class DoctorSummaryPreviewResponse(BaseModel):
  generated_at: datetime
  active_medication_count: int
  adherence_rate: float
  cycle_summary: str
  symptom_summary: str
  lifestyle_summary: str
  questions_for_doctor: list[str]

