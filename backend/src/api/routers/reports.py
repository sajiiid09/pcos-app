from fastapi import APIRouter

from ..schemas.reports import DoctorSummaryPreviewRequest, DoctorSummaryPreviewResponse
from ..services.report_preview import ReportPreviewService

router = APIRouter(prefix="/reports", tags=["reports"])
service = ReportPreviewService()


@router.post("/doctor-summary/preview", response_model=DoctorSummaryPreviewResponse)
async def doctor_summary_preview(
    payload: DoctorSummaryPreviewRequest,
) -> DoctorSummaryPreviewResponse:
  return service.build_preview(payload)

