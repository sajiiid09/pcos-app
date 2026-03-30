from typing import Annotated

from fastapi import APIRouter, Depends, HTTPException

from ..dependencies import get_content_repository
from ..repositories.content_repository import ContentRepository
from ..schemas.content import EvidenceArticleDetail, EvidenceArticleSummary

router = APIRouter(prefix="/content", tags=["content"])


@router.get("/articles", response_model=list[EvidenceArticleSummary])
async def list_articles(
    repository: Annotated[ContentRepository, Depends(get_content_repository)],
) -> list[EvidenceArticleSummary]:
  return [EvidenceArticleSummary(**article) for article in repository.list_articles()]


@router.get("/articles/{slug}", response_model=EvidenceArticleDetail)
async def get_article(
    slug: str,
    repository: Annotated[ContentRepository, Depends(get_content_repository)],
) -> EvidenceArticleDetail:
  article = repository.get_article(slug)
  if article is None:
    raise HTTPException(status_code=404, detail="Article not found")
  return EvidenceArticleDetail(**article)

