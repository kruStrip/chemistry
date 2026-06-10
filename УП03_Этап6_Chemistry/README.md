# УП.03 — Этап 6: Chemistry Na Easy

CI/CD, релиз и инцидент поддержки: issue → ветка → диагностика → fix → CI → PR → changelog/release.

## Быстрый старт

```bat
cd chemistry-backend
scripts\test.bat
scripts\release-check.bat
scripts\create-release.bat
```

## Содержимое

| Путь | Описание |
|------|----------|
| `docs/INCIDENT_REPORT.md` | Разбор инцидента входа |
| `docs/GITHUB_ISSUE.md` | Шаблон GitHub Issue |
| `docs/PULL_REQUEST.md` | Шаблон PR |
| `docs/RELEASE_CHECKLIST.md` | Чек-лист релиза v0.1.1 |
| `docs/CHANGELOG.md` | Журнал изменений |
| `docs/RELEASE_NOTES.md` | Заметки релиза |
| `docs/SUPPORT_REPORT.docx` | Итоговый отчёт этапа |
| `screenshots/` | 10 обязательных скриншотов |
| `reports/` | Вывод test/release-check |
| `scripts/` | test / build / release-check / create-release |
| `project_files_in_repository/` | Копии файлов для репозитория |
| `release/` | `chemistry_v0.1.1.zip` |

## Инцидент

**Тема:** при неверном пароле UI показывал «Сессия истекла».

**Ветка:** `support/fix-auth-error`

**Исправление:** `chemistry-frontend` + `chemistry-backend` (см. `INCIDENT_REPORT.md`).

## Примечание по тестам (Windows)

Backend: **182/182** unit-тестов проходят локально. Frontend Vitest на Windows может падать с `reading 'config'` (известно с этапа 4, BUG-02) — в **GitHub Actions / Linux** `npm run test:run` проходит. Для сдачи приложены логи `reports/test_run.txt` и скриншот CI.

## Связь с предыдущими этапами

- Этап 4: тестирование → `УП03_Этап4_Chemistry`
- Этап 5: безопасность → `УП03_Этап5_Chemistry`
- **Этап 6:** поддержка, CI/CD, релиз v0.1.1
