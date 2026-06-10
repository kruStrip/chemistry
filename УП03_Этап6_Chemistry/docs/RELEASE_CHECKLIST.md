# RELEASE_CHECKLIST.md — v0.1.1

## Перед релизом

- [x] GitHub Issue создан и привязан к ветке `support/fix-auth-error`
- [x] Инцидент воспроизведён и задокументирован (`INCIDENT_REPORT.md`)
- [x] Исправление в коде + commit с понятным сообщением
- [x] `scripts\test.bat` / `make check` — успешно
- [x] `scripts\release-check.bat` — успешно
- [x] `GET /health` → Healthy
- [x] GitHub Actions CI — green (workflow `ci.yml`)
- [x] Pull Request с `Closes #N` и чек-листом
- [x] `CHANGELOG.md` обновлён
- [x] `RELEASE_NOTES.md` обновлён
- [x] Архив релиза: `release/chemistry_v0.1.1.zip`
- [x] Тег `v0.1.1` (или GitHub Release)

## После релиза

- [ ] `scripts\deploy.bat` на demo-стенде
- [ ] Smoke: login с неверным паролем → корректное сообщение
- [ ] Smoke: login с верными данными → редирект в `/account`
- [ ] Мониторинг логов 15 мин после выкладки

## Контакты поддержки

- Issue tracker: GitHub Issues (chemistry-frontend / chemistry-backend)
- Документация: `DEPLOYMENT.md`, `deploy/RUNBOOK.md`
