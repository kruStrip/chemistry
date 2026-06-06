# RELEASE_NOTES.md — Chemistry demo v1.0.0

**Дата:** 06.06.2026  
**Версия:** 1.0.0-demo  
**Этап:** УП.03 — развертывание (этап 3)

## Что вошло в версию

- Локальный **Docker demo-стенд** с production-like сборкой frontend (nginx) и API (.NET 8 Release).
- Файлы `deploy/.env.demo.example`, `deploy/.env.production.example`.
- `deploy/docker-compose.demo.yml` и корневой `docker-compose.prod.yml`.
- Скрипты `deploy.bat`, `restart.bat`, `check_deploy.bat`, `build_release.bat`.
- Документация: `DEPLOYMENT.md`, `DEMO_GUIDE.md`, `RELEASE_NOTES.md`.

## Как запускать

```bat
cd chemistry-backend
scripts\deploy.bat
```

Адреса: http://localhost:3000 (frontend), http://localhost:5000/health (API).

## Известные ограничения

- Demo-стенд использует `ASPNETCORE_ENVIRONMENT=Development` и mock-интеграции (платежи, почта, доставка).
- Реальный production на VPS требует `deploy/docker-compose.prod.yml`, GHCR-образы и секреты из GitHub Actions.
- На пустой БД список курсов пуст до ручного наполнения через админку/API.
- Первая сборка образов может занять 10–20 минут.

## Исправления при подготовке этапа 3

- Добавлен отдельный compose для demo без зависимости от GHCR-образов.
- Вынесены demo/production env-шаблоны без реальных паролей.
- Добавлены BAT-скрипты развертывания и проверки для Windows.
