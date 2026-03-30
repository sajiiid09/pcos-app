from fastapi.testclient import TestClient

from api.main import app


def test_doctor_summary_preview() -> None:
  client = TestClient(app)
  response = client.post(
      "/api/v1/reports/doctor-summary/preview",
      json={
          "medications": [
              {
                  "medication_name": "Metformin",
                  "dosage": "500 mg",
                  "status": "taken",
                  "logged_at": "2026-03-28T08:00:00Z",
              }
          ],
          "cycles": [
              {
                  "start_date": "2026-03-24T00:00:00Z",
              }
          ],
          "symptoms": [
              {
                  "logged_at": "2026-03-28T09:00:00Z",
                  "pain_severity": "moderate",
                  "acne_severity": "mild",
                  "mood": "steady",
                  "energy": "low",
                  "sleep_quality": "steady",
                  "notes": "Low energy after lunch.",
              }
          ],
          "habits": [
              {
                  "logged_at": "2026-03-28T07:00:00Z",
                  "movement_minutes": 30,
                  "hydration_glasses": 6,
                  "sleep_hours": 7.5,
                  "stress_level": "steady",
              }
          ],
      },
  )

  assert response.status_code == 200
  payload = response.json()
  assert payload["active_medication_count"] == 1
  assert payload["adherence_rate"] == 100.0
  assert "30 minutes" in payload["lifestyle_summary"]


def test_doctor_summary_preview_validation_error_shape() -> None:
  client = TestClient(app)
  response = client.post(
      "/api/v1/reports/doctor-summary/preview",
      json={
          "medications": [
              {
                  "medication_name": "Metformin",
                  "dosage": "500 mg",
                  "status": "taken",
              }
          ],
      },
  )

  assert response.status_code == 422
  assert response.json() == {
      "error": {
          "code": "validation_error",
          "message": "Invalid request payload.",
      }
  }

