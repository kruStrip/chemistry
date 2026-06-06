# API_TEST_REPORT.md

**Дата:** 06.06.2026  
**Стенд:** demo Docker (`docker-compose.demo.yml`)  
**Base URL:** http://localhost:5000

## Успешные запросы (5)

| # | Метод | Endpoint | Код | Результат |
|---|-------|----------|-----|-----------|
| 1 | GET | `/health` | 200 | `{"status":"Healthy",...}` |
| 2 | GET | `/api/v1/courses` | 200 | `{"items":[],"page":1,...}` |
| 3 | GET | `/api/v1/kits` | 200 | `[]` |
| 4 | GET | `/api/v1/reviews` | 200 | список отзывов |
| 5 | GET | `/swagger/v1/swagger.json` | 200 | OpenAPI 67 paths |

## Ошибочные сценарии (2) — корректная обработка

| # | Метод | Endpoint | Код | Ожидание |
|---|-------|----------|-----|----------|
| 1 | POST | `/api/v1/auth/login` (неверный пароль) | **401** | Invalid credentials |
| 2 | GET | `/api/v1/courses/nonexistent-slug-99999` | **404** | Not Found (не 500) |

## Инструменты

- `scripts/api-test.bat` — автоматизация curl
- `reports/postman_collection.json` — коллекция Postman
- `tests/api/smoke_api.ps1` — PowerShell smoke

## Вывод

API отвечает предсказуемо: успешные GET возвращают 200, ошибки аутентификации — 401, отсутствие ресурса — 404. Критических 500 при smoke-прогоне не обнаружено.
