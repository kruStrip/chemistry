# УП.03 — Этап 5: Chemistry Na Easy

Безопасность и эксплуатационные риски demo-стенда после развёртывания (этап 3) и тестирования (этап 4).

## Быстрый старт

```bat
cd chemistry-backend\deploy
docker compose up -d

cd ..\..\УП03_Этап5_Chemistry
scripts\security-check.bat
scripts\deps-check.bat
powershell -ExecutionPolicy Bypass -File scripts\access-test.ps1
scripts\backup.bat
scripts\ports-check.bat
scripts\logs-security.bat
```

## Содержимое

| Путь | Описание |
|------|----------|
| `docs/SECURITY_CHECKLIST.md` | 12 проверок с доказательствами |
| `docs/RISK_REGISTER.md` | 10 рисков (security + эксплуатация) |
| `docs/BACKUP_RESTORE_REPORT.md` | pg_dump / restore PostgreSQL |
| `docs/SECURITY_REPORT.docx` | Итоговый отчёт этапа |
| `docs/RECOMMENDATIONS.md` | Дальнейшие меры |
| `scripts/` | security-check, deps-check, backup, restore, ports, logs, access-test |
| `screenshots/` | 12 обязательных скриншотов |
| `project_files_in_repository/` | .gitignore, .env.example, SECURITY.md, compose |
| `backups/` | SQL-дампы (не в Git) |
| `reports/` | вывод скриптов |

## Связь с предыдущими этапами

- Этап 3: deploy, restart → `УП03_Этап3_Chemistry`
- Этап 4: тесты, Lighthouse → `УП03_Этап4_Chemistry`
- **Этап 5:** секреты, роли, CORS, backup/restore, порты, логи
