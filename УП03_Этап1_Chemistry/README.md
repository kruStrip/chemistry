# УП.03 — Этап 1. Входной аудит проекта Chemistry

Образовательная платформа **Chemistry Na Easy**: онлайн-курсы по химии, каталог, корзина, оплата, личный кабинет, админка.

## Репозитории

| Часть | Стек | URL |
|-------|------|-----|
| Backend | C# / .NET 8, ASP.NET Core, PostgreSQL, Redis, MinIO | https://github.com/Studio-Kairos/chemistry-backend.git |
| Frontend | React 19, TypeScript, Vite 8, Tailwind CSS | https://github.com/Studio-Kairos/chemistry-frontend.git |

## Быстрый запуск (локально)

1. Backend: `cd chemistry-backend/deploy` → `Copy-Item .env.example .env` → `docker compose up -d`
2. Frontend: `cd chemistry-frontend` → `npm ci` → `Copy-Item .env.example .env` → `npm run dev`
3. Открыть: http://localhost:3000 (фронт), http://localhost:5000/swagger (API)

Подробнее: `03_Инструкция_запуска.md`

## Содержимое папки сдачи

| Файл | Назначение |
|------|------------|
| `01_Входной_аудит_проекта.docx` | Основной отчёт |
| `02_Состав_проекта.xlsx` | Файлы и папки проекта |
| `03_Инструкция_запуска.md` | Пошаговый запуск |
| `04_Таблица_конфигурации.xlsx` | Переменные окружения |
| `05_Журнал_проблем.xlsx` | Найденные проблемы |
| `.env.example` | Сводный шаблон настроек |
| `repo_link.txt` | Ссылки на GitHub |
| `screenshots/` | Скриншоты проверки |
| `logs/` | Логи запуска и health-check |

## Текущее состояние (аудит 06.06.2026)

- **Backend API**: запускается, `/health` → Healthy, Swagger — 67 эндпоинтов
- **Frontend**: запускается на порту 3000, Vitest — 60 тестов пройдено
- **Unit-тесты backend**: 182 пройдено
- **Готовность**: проект **частично готов** к следующему этапу (см. журнал проблем)

> Переименуйте папку по шаблону: `УП03_Этап1_Фамилия_Имя_Группа`
