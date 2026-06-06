# Chemistry Na Easy

Образовательная платформа по химии: backend (.NET 8) + frontend (React 19 / Vite 8).

## Установка

Полная инструкция: **[INSTALL.md](INSTALL.md)**

```bat
scripts\setup.bat      :: зависимости
scripts\docker-up.bat  :: полный стек в Docker (dev)
scripts\deploy.bat     :: demo-стенд (УП.03 этап 3)
scripts\check.bat      :: линтеры и тесты
```

Развертывание: **`chemistry-backend/DEPLOYMENT.md`**

| Сервис | URL |
|--------|-----|
| Frontend | http://localhost:3000 |
| API / Swagger | http://localhost:5000/swagger |
| Health | http://localhost:5000/health |

## Структура

```
chemistry/
├── chemistry-backend/    — API, PostgreSQL, Redis, MinIO
├── chemistry-frontend/   — SPA
├── scripts/              — BAT-скрипты запуска (Windows)
├── Makefile              — единая карта команд
├── docker-compose.yml    — обёртка над backend/deploy
└── INSTALL.md
```

## Репозитории

Корневая папка `chemistry/` — отдельный git-репозиторий (материалы УП.03, scripts, docker-compose).
`chemistry-backend/` и `chemistry-frontend/` — **независимые** репозитории, в корневой git не входят.

| Репозиторий | Назначение |
|-------------|------------|
| [kruStrip/chemistry](https://github.com/kruStrip/chemistry) | обёртка, УП.03, скрипты |
| [kruStrip/chemistry-backend](https://github.com/kruStrip/chemistry-backend) | API (.NET 8) |
| [kruStrip/chemistry-frontend](https://github.com/kruStrip/chemistry-frontend) | SPA (React 19) |

Upstream (оригинал): Studio-Kairos/chemistry-backend, Studio-Kairos/chemistry-frontend.
