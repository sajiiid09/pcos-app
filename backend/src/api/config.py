from functools import lru_cache

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
  app_name: str = "PCOS Companion API"
  api_prefix: str = "/api/v1"
  database_url: str = "sqlite+aiosqlite:///./pcos_backend.db"

  model_config = SettingsConfigDict(
      env_file=".env",
      env_file_encoding="utf-8",
      extra="ignore",
  )


@lru_cache
def get_settings() -> Settings:
  return Settings()

