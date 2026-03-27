import uvicorn
from fastapi import FastAPI

from .config import get_settings
from .logging_config import configure_logging
from .routers.content import router as content_router
from .routers.reports import router as reports_router
from .routers.system import router as system_router


def create_app() -> FastAPI:
  configure_logging()
  settings = get_settings()
  app = FastAPI(title=settings.app_name)
  app.include_router(system_router)
  app.include_router(content_router, prefix=settings.api_prefix)
  app.include_router(reports_router, prefix=settings.api_prefix)
  return app


app = create_app()


def main() -> None:
  uvicorn.run("api.main:app", host="0.0.0.0", port=8000, reload=True)

