from pydantic import BaseModel


class EvidenceArticleSummary(BaseModel):
  slug: str
  title: str
  summary: str
  category: str


class EvidenceArticleDetail(EvidenceArticleSummary):
  body: str

