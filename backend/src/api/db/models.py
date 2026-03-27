from sqlalchemy import String, Text
from sqlalchemy.orm import Mapped, mapped_column

from .base import Base


class EvidenceArticleModel(Base):
  __tablename__ = "evidence_articles"

  slug: Mapped[str] = mapped_column(String(120), primary_key=True)
  title: Mapped[str] = mapped_column(String(200))
  summary: Mapped[str] = mapped_column(Text())
  body: Mapped[str] = mapped_column(Text())
  category: Mapped[str] = mapped_column(String(80))


class ServiceMetadataModel(Base):
  __tablename__ = "service_metadata"

  key: Mapped[str] = mapped_column(String(80), primary_key=True)
  value: Mapped[str] = mapped_column(String(200))

