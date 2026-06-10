# RELEASE_NOTES.md — v0.1.1

См. полную версию: `chemistry-backend/RELEASE_NOTES.md`

## Что исправлено

- UX входа: явное сообщение при неверном пароле.
- Подготовка релизного конвейера (BAT + Makefile + CI).

## Как обновить

```bat
cd chemistry-backend
git checkout main
git pull
scripts\release-check.bat
scripts\deploy.bat
```

## Проверка

1. http://localhost:3000/login — неверный пароль → «Неверный email или пароль»
2. http://localhost:5000/health → `"status":"Healthy"`
