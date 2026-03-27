import sqlite3
from pathlib import Path

from alembic.config import Config

from alembic import command
from api.config import get_settings


def test_alembic_upgrade_head(tmp_path, monkeypatch) -> None:
  database_path = tmp_path / "migration_test.db"
  monkeypatch.setenv("DATABASE_URL", f"sqlite+aiosqlite:///{database_path}")
  get_settings.cache_clear()

  config = Config(str(Path(__file__).resolve().parents[1] / "alembic.ini"))
  command.upgrade(config, "head")

  connection = sqlite3.connect(database_path)
  table_names = {
      row[0]
      for row in connection.execute(
          "SELECT name FROM sqlite_master WHERE type='table'"
      )
  }
  connection.close()

  assert "evidence_articles" in table_names
  assert "service_metadata" in table_names

