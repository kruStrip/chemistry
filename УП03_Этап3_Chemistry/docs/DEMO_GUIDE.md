# DEMO_GUIDE.md — Chemistry Na Easy

## Как быстро проверить проект

1. Убедитесь, что установлен **Docker Desktop** и запущен.
2. Клонируйте репозитории backend и frontend в соседние папки.
3. Выполните:

```bat
cd chemistry-backend
scripts\deploy.bat
```

4. Откройте в браузере:
   - http://localhost:3000 — главная страница
   - http://localhost:5000/health — статус API
   - http://localhost:5000/swagger — документация API

5. Проверьте основной сценарий:
   - главная страница загружается без ошибок в консоли;
   - в Swagger выполните `GET /api/v1/courses` (код 200);
   - `GET /health` возвращает `"status":"Healthy"`;
   - перезапуск: `scripts\restart.bat` — сервисы снова в состоянии `running`.

## Альтернатива: release-архив

1. Распакуйте `УП03_Этап3_Chemistry/release/project_release.zip`.
2. Следуйте `demo_readme.txt` внутри архива.
3. Запустите `scripts\deploy.bat` из распакованной папки (нужны полные репозитории рядом).

## Тестовые данные

На чистой demo-БД каталог курсов **пуст** (автосида нет). Это ожидаемое поведение.

Для проверки API без данных достаточно health и swagger. Демо-аккаунты не требуются — авторизация опциональна для просмотра каталога.

## Что считается успешной проверкой

- контейнеры `api`, `frontend`, `postgres`, `redis` в статусе **running**;
- http://localhost:3000 открывается вне IDE;
- `/health` отвечает Healthy;
- в логах нет критических ошибок (connection refused, crash loop);
- `restart.bat` успешно перезапускает стек.
