# SECURITY_CHECKLIST.md — УП.03 Этап 5, Chemistry Na Easy

| Проверка | Статус | Доказательство | Что исправлено |
|---|---|---|---|
| .env не загружен в Git | выполнено | скриншот 01 | `.env` в `.gitignore` (backend + root) |
| .env.example без реальных секретов | выполнено | скриншот 02 | значения `change_me`, пустые ключи API |
| Ручной поиск секретов выполнен | выполнено | скриншот 03 | совпадения только в тестах/шаблонах |
| Зависимости проверены | выполнено | скриншот 04 | `npm audit`, `dotnet list package --vulnerable` |
| Проверены роли | выполнено | скриншот 05 | Student → admin `/api/v1/admin/users` → 403 |
| Проверен доступ к чужим данным | выполнено | скриншот 06 | чужой Order → 403 Forbidden |
| CORS/hosts/debug проверены | выполнено | скриншот 07 | Production: явные origins; Dev: AllowAnyOrigin |
| Backup создан | выполнено | скриншот 08 | `scripts/backup.bat` → `backups/*.sql` |
| Restore проверен | выполнено | скриншот 09 | `restore.bat` + COUNT после pg_restore |
| Открытые порты проверены | выполнено | скриншот 10 | `docker compose ps`, `netstat` |
| Логи без критических ошибок | выполнено | скриншот 11 | нет повторяющихся fatal/traceback |
| Commit этапа 5 | выполнено | скриншот 12 | артефакты в `УП03_Этап5_Chemistry` |
