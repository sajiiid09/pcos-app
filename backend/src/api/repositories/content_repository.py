from ..data.evidence_articles import ARTICLE_FIXTURES


class ContentRepository:
  def list_articles(self) -> list[dict[str, str]]:
    return ARTICLE_FIXTURES

  def get_article(self, slug: str) -> dict[str, str] | None:
    return next((article for article in ARTICLE_FIXTURES if article["slug"] == slug), None)

