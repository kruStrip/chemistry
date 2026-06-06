# DEPLOYMENT.md — Chemistry Na Easy

## 1. Где развернут проект

**Вариант:** локальный **Docker demo-стенд** (УП.03 этап 3, вариант C).

Проект поднимается вне IDE командой `docker compose -f docker-compose.prod.yml up --build -d` и открывается в браузере по локальным адресам.

| Сервис | Адрес |
|--------|-------|
| Frontend (SPA) | http://localhost:3000 |
| API Health | http://localhost:5000/health |
| Swagger | http://localhost:5000/swagger |
| MinIO Console | http://localhost:9001 |

Для реального VPS с GHCR-образами используется `deploy/docker-compose.prod.yml` и GitHub Actions workflow `deploy` (см. `deploy/RUNBOOK.md`).

## 2. Требования

| Компонент | Версия |
|-----------|--------|
| ОС | Windows 10/11, Linux, macOS |
| Docker Desktop / Docker Engine | 24+ |
| Docker Compose | v2 |
| Git | актуальная |
| Репозитории рядом | `chemistry-backend/` и `chemistry-frontend/` в одной родительской папке |

**Порты:** 3000 (frontend), 5000 (API), 5432 (Postgres), 6379 (Redis), 9000/9001 (MinIO).

**База данных:** PostgreSQL 15 в контейнере, миграции применяются при старте API (`Database__ApplyMigrationsOnStartup=true`).

**Переменные окружения:** `deploy/.env.demo` (из `deploy/.env.demo.example`). Production-шаблон: `deploy/.env.production.example`.

## 3. Команды развертывания

```powershell
git clone https://github.com/Studio-Kairos/chemistry-backend.git
git clone https://github.com/Studio-Kairos/chemistry-frontend.git

cd chemistry-backend\deploy
copy .env.demo.example .env.demo
# Задайте JWT_SECRET (мин. 32 символа) и пароли POSTGRES/REDIS/MINIO

cd ..
scripts\deploy.bat
```

Или вручную:

```powershell
cd chemistry-backend\deploy
docker compose -f docker-compose.demo.yml up --build -d
docker compose -f docker-compose.demo.yml ps
```

Из корня монорепозитория `chemistry/`:

```powershell
docker compose -f docker-compose.prod.yml up --build -d
```

## 4. Проверка

- **Адрес приложения:** http://localhost:3000
- **Health API:** `curl http://localhost:5000/health` → `"status":"Healthy"`
- **Логи:** `scripts\check_deploy.bat` или `docker compose -f deploy/docker-compose.demo.yml logs --tail=80`
- **Перезапуск:** `scripts\restart.bat`
- **Основной сценарий:** открыть главную → каталог курсов → Swagger `/api/v1/courses` → health без ошибок

## 5. Остановка и перезапуск

```powershell
cd chemistry-backend\deploy
docker compose -f docker-compose.demo.yml down
docker compose -f docker-compose.demo.yml up --build -d
```

С удалением данных demo-БД:

```powershell
docker compose -f docker-compose.demo.yml down -v
```

## 6. Файлы развертывания в репозитории

| Файл | Назначение |
|------|------------|
| `deploy/docker-compose.demo.yml` | Локальный demo-стенд с локальной сборкой |
| `deploy/docker-compose.prod.yml` | VPS-стек с GHCR-образами и Nginx |
| `deploy/.env.demo.example` | Шаблон demo-окружения |
| `deploy/.env.production.example` | Шаблон production-окружения |
| `deploy/nginx/demo.conf` | Опциональный reverse proxy |
| `scripts/deploy.bat` | Развертывание |
| `scripts/restart.bat` | Перезапуск |
| `scripts/check_deploy.bat` | Статус, логи, health |
| `scripts/build_release.bat` | Архив `project_release.zip` |
