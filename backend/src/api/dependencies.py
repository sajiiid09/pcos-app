from .repositories.content_repository import ContentRepository
from .services.report_preview import ReportPreviewService


def get_content_repository() -> ContentRepository:
  return ContentRepository()


def get_report_preview_service() -> ReportPreviewService:
  return ReportPreviewService()