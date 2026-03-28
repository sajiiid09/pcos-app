from collections.abc import AsyncIterator

import structlog
from sqlalchemy import text
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.ext.asyncio import (
  AsyncEngine,
  AsyncSession,
  async_sessionmaker,
  create_async_engine,
)

from ..config import get_settings

_engine: AsyncEngine | None = None
_session_factory: async_sessionmaker[AsyncSession] | None = None
logger = structlog.get_logger(__name__)


def get_engine() -> AsyncEngine:
  global _engine, _session_factory
  if _engine is None:
    settings = get_settings()
    _engine = create_async_engine(settings.database_url, future=True, pool_pre_ping=True)
    _session_factory = async_sessionmaker(_engine, expire_on_commit=False)
  return _engine


def get_session_factory() -> async_sessionmaker[AsyncSession]:
  global _session_factory
  if _session_factory is None:
    get_engine()
  if _session_factory is None:
    raise RuntimeError("Database session factory was not initialized.")
  return _session_factory


async def get_db_session() -> AsyncIterator[AsyncSession]:
  async with get_session_factory()() as session:
    yield session


async def close_engine() -> None:
  global _engine, _session_factory
  if _engine is not None:
    await _engine.dispose()
  _engine = None
  _session_factory = None


async def ping_database() -> bool:
  try:
    async with get_session_factory()() as session:
      await session.execute(text("SELECT 1"))
    return True
  except SQLAlchemyError as exc:
    logger.warning("database_ping_failed", error=str(exc))
    return False
  except RuntimeError as exc:
    logger.warning("database_ping_runtime_error", error=str(exc))
    return False

