from fastapi import APIRouter

from ..db.session import ping_database
from ..schemas.system import HealthResponse, ReadinessResponse

router = APIRouter(tags=["system"])


@router.get("/healthz", response_model=HealthResponse)
async def healthz() -> HealthResponse:
  return HealthResponse(status="ok")


@router.get("/readyz", response_model=ReadinessResponse)
async def readyz() -> ReadinessResponse:
  database_ready = await ping_database()
  return ReadinessResponse(
      status="ready" if database_ready else "degraded",
      database=database_ready,
  )

