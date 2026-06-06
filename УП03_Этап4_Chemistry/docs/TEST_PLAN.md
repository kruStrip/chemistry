# TEST_PLAN.md

## 1. Что проверяется

Проект: **Chemistry Na Easy** (fullstack: React 19 + ASP.NET Core 8 + PostgreSQL)  
Версия / ветка: `main`, backend `d5ea39e`, frontend `50d8d36` (+ fix `/register`)  
Адрес / способ запуска: demo Docker — `chemistry-backend\scripts\deploy.bat`  
URLs: http://localhost:3000, http://localhost:5000/swagger

## 2. Основные сценарии

| ID | Сценарий | Ожидаемый результат | Инструмент | Статус |
|----|----------|---------------------|------------|--------|
| TC-01 | Открыть главную страницу | Страница открылась без критических ошибок | Browser/DevTools | passed |
| TC-02 | Открыть Swagger UI | Документация API доступна, 67 paths | Swagger | passed |
| TC-03 | GET /health, /api/v1/courses, /api/v1/kits | Коды 200, валидный JSON | curl/Postman | passed |
| TC-04 | Логин с неверными данными | HTTP 401, понятное сообщение | curl | passed |
| TC-05 | Запрос несуществующего курса | HTTP 404, не 500 | curl | passed |
| TC-06 | Переход /login → /register | Форма регистрации открывается | UI/DevTools | passed (после BUG-01) |
| TC-07 | DevTools Console при навигации | Нет красных uncaught exception | DevTools | passed |
| TC-08 | Network: API-запросы с главной | 200/304 для публичных эндпоинтов | DevTools Network | passed |
| TC-09 | Backend unit tests | 182 passed, 0 failed | dotnet test | passed |
| TC-10 | Frontend unit tests (Vitest) | 53+ passed | npm test | passed* |
| TC-11 | Логи после smoke-сценариев | Нет FATAL/Traceback | docker logs | passed |
| TC-12 | Lighthouse Performance | Отчёт с метриками Performance/A11y | Lighthouse | passed |

\* TC-10: на Windows возможен таймаут worker для 1 файла (BUG-02); обход: `--pool=threads --maxWorkers=1`.

## 3. Инструменты

- **DevTools Console/Network/Performance:** Chrome, проверка http://localhost:3000
- **Lighthouse:** `npx lighthouse http://localhost:3000` → `reports/lighthouse_report.html`
- **Postman/curl:** коллекция `reports/postman_collection.json`, скрипт `scripts/api-test.bat`
- **pytest/npm test:** `dotnet test` (182), `npx vitest run` (53+)
- **k6:** `tests/load/basic_load.js` (если k6 установлен) или curl-замер health
- **logs:** `scripts/logs-check.bat` → `reports/logs_tail.txt`

## 4. Итог

Критические ошибки: **0** (блокирующих для demo-стенда)  
Некритические ошибки: **3** (DEFECT_LOG: BUG-01 fixed, BUG-02 open, BUG-03 open)  
Вывод: **готов к дальнейшей эксплуатации demo-стенда** с оговорками по наполнению каталога и стабильности Vitest на Windows.
