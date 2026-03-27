from fastapi.testclient import TestClient

from api.main import app


def test_list_articles() -> None:
  client = TestClient(app)
  response = client.get("/api/v1/content/articles")

  assert response.status_code == 200
  payload = response.json()
  assert len(payload) >= 3
  assert payload[0]["slug"] == "what-is-pcos"


def test_article_detail() -> None:
  client = TestClient(app)
  response = client.get("/api/v1/content/articles/food-myths")

  assert response.status_code == 200
  assert response.json()["title"] == "Food myths vs evidence"

