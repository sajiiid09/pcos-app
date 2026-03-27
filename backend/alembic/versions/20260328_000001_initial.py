"""initial schema

Revision ID: 20260328_000001
Revises:
Create Date: 2026-03-28 00:00:01
"""

from collections.abc import Sequence

import sqlalchemy as sa

from alembic import op

revision: str = "20260328_000001"
down_revision: str | None = None
branch_labels: Sequence[str] | None = None
depends_on: Sequence[str] | None = None


def upgrade() -> None:
  op.create_table(
      "evidence_articles",
      sa.Column("slug", sa.String(length=120), primary_key=True),
      sa.Column("title", sa.String(length=200), nullable=False),
      sa.Column("summary", sa.Text(), nullable=False),
      sa.Column("body", sa.Text(), nullable=False),
      sa.Column("category", sa.String(length=80), nullable=False),
  )
  op.create_table(
      "service_metadata",
      sa.Column("key", sa.String(length=80), primary_key=True),
      sa.Column("value", sa.String(length=200), nullable=False),
  )


def downgrade() -> None:
  op.drop_table("service_metadata")
  op.drop_table("evidence_articles")

