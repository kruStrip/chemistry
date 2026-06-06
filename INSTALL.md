# Chemistry — установка и запуск (УП.03, этап 2)

Монорепо: `chemistry-backend` + `chemistry-frontend` в одной родительской папке.

## Требования

| Инструмент | Версия |
|------------|--------|
| .NET SDK | 8.0+ |
| Node.js | 20+ |
| Docker Desktop | 24+ |
| Git | актуальная |

## Быстрый старт (Windows)

```bat
git clone https://github.com/Studio-Kairos/chemistry-backend.git
git clone https://github.com/Studio-Kairos/chemistry-frontend.git
cd chemistry-backend
scripts\setup.bat
scripts\docker-up.bat
```

Открыть: http://localhost:3000 (фронт), http://localhost:5000/swagger (API).

## Команды проекта

| Действие | BAT | Makefile | Docker |
|----------|-----|----------|--------|
| Установка | `scripts\setup.bat` | `make setup` | `docker compose build` |
| Запуск (dev) | `scripts\run.bat` | `make run` | — |
| Полный стек | `scripts\docker-up.bat` | `make docker-up` | `docker compose up --build` |
| Проверка | `scripts\check.bat` | `make check` | — |
| Форматирование | `scripts\format.bat` | `make format` | — |
| Логи | `scripts\logs.bat` | `make logs` | `docker compose logs -f` |
| Остановка | `scripts\docker-down.bat` | `make docker-down` | `docker compose down` |

> BAT-файлы в корне `chemistry/` (родительская папка): `..\scripts\setup.bat`  
> BAT-файлы в `chemistry-backend/scripts/`: работают при клонировании только backend (frontend — соседняя папка).

## Локальный запуск без полного Docker

```bat
scripts\setup.bat
cd chemistry-backend\deploy
docker compose up -d postgres redis minio minio-init
cd ..\..
scripts\run.bat
```

## Инструменты качества

| Часть | Линтер / проверка | Форматтер |
|-------|-------------------|-----------|
| Backend | `dotnet build`, `dotnet test`, `dotnet format --verify-no-changes` | `dotnet format` |
| Frontend | `eslint`, `tsc --noEmit`, `vitest` | `prettier` |

## Репозитории

- Backend: https://github.com/Studio-Kairos/chemistry-backend.git
- Frontend: https://github.com/Studio-Kairos/chemistry-frontend.git
