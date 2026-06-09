# BACKUP_RESTORE_REPORT.md — УП.03 Этап 5

## Конфигурация

| Параметр | Значение |
|----------|----------|
| СУБД | PostgreSQL 15 (Alpine) |
| БД | `chemistry_db` |
| Пользователь | `chemistry_user` |
| API (demo) | подключение к удалённому Postgres (`Host=213.139.208.63`) |
| Backup source | тот же хост, что использует API (`scripts/_resolve_pg_host.py`) |
| Restore target | **локальный** контейнер `postgres` (тестовое восстановление) |

## Backup

**Команда:** `scripts\backup.bat`

**Результат (09.06.2026):**

- Файл: `backups/backup_20260609_18.sql`
- Размер: ~620 KB
- Инструмент: `pg_dump` из контейнера `postgres` с `-h 213.139.208.63`

**Проверка:** файл не пустой, содержит `CREATE TABLE`, `COPY` для таблиц `User`, `Order`, `Course`.

## Restore

**Команда:** `scripts\restore.bat backup_20260609_18.sql`

**Шаги:**

1. `DROP SCHEMA public CASCADE; CREATE SCHEMA public;` — локальная тестовая БД.
2. Импорт SQL из backup-файла.
3. Проверка: `SELECT COUNT(*) FROM "User"; SELECT COUNT(*) FROM "Order";`

**Результат после restore (локальный postgres):**

| Таблица | Записей |
|---------|---------|
| User | 42 |
| Order | 277 |

**Вывод:** данные из backup успешно восстановлены в локальный контейнер; схема и строки совпадают с дампом.

## Замечания

- Restore **не** выполнялся на production-сервер — только на локальный Docker-том для безопасной проверки.
- На сервере используется `deploy/scripts/postgres-backup.sh` с retention `BACKUP_RETENTION_DAYS`.
- Рекомендуется автоматизировать backup по cron и хранить копии вне сервера приложения.
