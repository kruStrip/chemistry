# RECOMMENDATIONS.md — УП.03 Этап 5

## Краткосрочно (1–2 недели)

1. **CI security check** — добавить в GitHub Actions шаги `npm audit --audit-level=high` и `dotnet list package --vulnerable` с fail при critical.
2. **Secret scanning** — включить GitHub Secret Scanning / pre-commit hook с `git grep` по шаблону из `security-check.bat`.
3. **Закрыть порты БД на demo-сервере** — убрать проброс `5432:5432` и `6379:6379` из публичного compose или ограничить firewall.

## Среднесрочно (1–3 месяца)

4. **Автоматический backup** — cron + `postgres-backup.sh`, retention по `BACKUP_RETENTION_DAYS`.
5. **HTTPS everywhere** — prod/staging уже через nginx; для локали — optional mkcert.
6. **Rate limiting** — включить `Security__EnableRateLimiting=true` на staging/prod.
7. **Отключить Swagger** на публичном demo (`Swagger__Enabled=false`).

## Долгосрочно

8. **Мониторинг** — алерты Grafana/Loki на 5xx, рост 401/403, падение health.
9. **Пентest / OWASP ZAP** — прогон по staging перед релизом.
10. **Ротация секретов** — JWT, Redis, MinIO, payment webhooks по календарю.

## Уже сделано в рамках этапа 5

- Обновлён корневой `.gitignore` (backups, dumps, logs, node_modules, .venv).
- Добавлен `chemistry-backend/SECURITY.md`.
- Скрипты `backup.bat` / `restore.bat` / `security-check.bat` в `УП03_Этап5_Chemistry/scripts/`.
- Проверены роли и доступ к чужим заказам (API-тест).
