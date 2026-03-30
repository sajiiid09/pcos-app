from contextlib import asynccontextmanager

import structlog
import uvicorn
from fastapi import FastAPI, HTTPException, Request
from fastapi.exceptions import RequestValidationError
from fastapi.responses import JSONResponse

from .config import get_settings
from .db.session import close_engine, get_engine
from .logging_config import configure_logging
from .routers.content import router as content_router
from .routers.reports import router as reports_router
from .routers.system import router as system_router

logger = structlog.get_logger(__name__)


@asynccontextmanager
async def lifespan(_: FastAPI):
  get_engine()
  yield
  await close_engine()


def _error_payload(code: str, message: str) -> dict[str, dict[str, str]]:
  return {"error": {"code": code, "message": message}}


def create_app() -> FastAPI:
  configure_logging()
  settings = get_settings()
  app = FastAPI(title=settings.app_name, lifespan=lifespan)

  @app.exception_handler(HTTPException)
  async def http_exception_handler(
      _: Request,
      exc: HTTPException,
  ) -> JSONResponse:
    detail = str(exc.detail) if exc.detail else "Request failed"
    return JSONResponse(
      status_code=exc.status_code,
      content=_error_payload("http_error", detail),
    )

  @app.exception_handler(RequestValidationError)
  async def request_validation_exception_handler(
      _: Request,
      exc: RequestValidationError,
  ) -> JSONResponse:
    logger.info("request_validation_failed", errors=exc.errors())
    return JSONResponse(
      status_code=422,
      content=_error_payload("validation_error", "Invalid request payload."),
    )

  @app.exception_handler(Exception)
  async def unhandled_exception_handler(_: Request, exc: Exception) -> JSONResponse:
    logger.exception("unhandled_exception", error=str(exc))
    return JSONResponse(
      status_code=500,
      content=_error_payload("internal_error", "Unexpected server error."),
    )

  app.include_router(system_router)
  app.include_router(content_router, prefix=settings.api_prefix)
  app.include_router(reports_router, prefix=settings.api_prefix)
  return app


app = create_app()


def main() -> None:
  settings = get_settings()
  uvicorn.run(
      "api.main:app",
      host="0.0.0.0",
      port=settings.api_port,
      reload=settings.environment == "development",
  )

