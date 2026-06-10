# Pull Request — support/fix-auth-error → main

## Что исправлено

- Разделены сообщения 401: неверные учётные данные vs истёкшая сессия
- `auth/login` не запускает refresh-flow при ошибке входа
- API возвращает `detail` на русском для `Invalid credentials`
- Добавлены CI/CD артефакты этапа 6 (скрипты, `ci.yml`, changelog)

## Связанный issue

Closes #1

## Как проверял

- `scripts\test.bat`
- `scripts\release-check.bat`
- `make check` (Linux CI)
- GitHub Actions CI
- Ручной сценарий: `/login` с неверным паролем

## Скриншоты

См. `УП03_Этап6_Chemistry/screenshots/` (пункты 01–10 этапа 6).
