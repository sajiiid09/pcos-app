mobile.setup:
	cd app && flutter pub get && dart run build_runner build --delete-conflicting-outputs

mobile.analyze:
	cd app && flutter analyze

mobile.test:
	cd app && flutter test

api.setup:
	cd backend && uv sync

api.migrate:
	cd backend && uv run alembic upgrade head

api.test:
	cd backend && uv run pytest

api.lint:
	cd backend && uv run ruff check .

check: mobile.analyze mobile.test api.lint api.test
