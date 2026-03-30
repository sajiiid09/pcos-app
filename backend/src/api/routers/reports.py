from typing import Annotated

from fastapi import APIRouter, Depends

from ..dependencies import get_report_preview_service
from ..schemas.reports import DoctorSummaryPreviewRequest, DoctorSummaryPreviewResponse
from ..services.report_preview import ReportPreviewService

router = APIRouter(prefix="/reports", tags=["reports"])


@router.post("/doctor-summary/preview", response_model=DoctorSummaryPreviewResponse)
async def doctor_summary_preview(
    payload: DoctorSummaryPreviewRequest,
  service: Annotated[ReportPreviewService, Depends(get_report_preview_service)],
) -> DoctorSummaryPreviewResponse:
  return service.build_preview(payload)

