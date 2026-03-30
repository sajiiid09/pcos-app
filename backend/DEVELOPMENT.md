# DEVELOPMENT

## Scope

- Minimal FastAPI foundation for system health, content, and report preview APIs.
- Keep architecture simple: routers, services, repositories, schemas.

## Setup

1. `uv sync`
2. `uv run alembic upgrade head`

## Common Commands

- Run tests: `uv run pytest`
- Run lint: `uv run ruff check .`
- Run migrations: `uv run alembic upgrade head`
- Run API: `uv run api`

## Local Database

- Default: SQLite via `DATABASE_URL` fallback in settings.
- PostgreSQL (optional local dev):
  1. From repo root run `docker compose up -d postgres`
  2. Set `DATABASE_URL=postgresql+asyncpg://pcos:pcos@localhost:5432/pcos_app`
  3. Run migrations again.

## Conventions

- Use dependency injection in routers, avoid module-level mutable service/repository instances.
- Keep API errors structured and safe for clients.
- Keep request validation strict via Pydantic schemas.
- Ensure startup/shutdown lifecycle manages DB resources cleanly.

