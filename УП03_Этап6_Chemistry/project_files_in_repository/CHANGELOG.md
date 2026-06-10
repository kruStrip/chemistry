# CHANGELOG.md

Все заметные изменения Chemistry Na Easy документируются в этом файле.

## [0.1.1] - 2026-06-10

### Fixed

- Исправлено сообщение при неверном пароле на `/login`: вместо «Сессия истекла…» показывается «Неверный email или пароль».
- Клиент `auth/login` больше не пытается обновить JWT при 401 — ошибка входа не маскируется refresh-flow.

### Changed

- Добавлены скрипты `test.bat`, `build.bat`, `release-check.bat`, `create-release.bat`.
- В `Makefile` появились цели `test`, `build`, `release-check`.
- Добавлен workflow `.github/workflows/ci.yml` для единой проверки перед релизом.

### Verified

- Локально: `scripts\test.bat`, `make check`
- CI: GitHub Actions (`backend.yml`, `frontend.yml`, `ci.yml`)

## [1.0.0-demo] - 2026-06-06

### Added

- Docker demo-стенд, BAT-скрипты развёртывания, `DEPLOYMENT.md`, `DEMO_GUIDE.md`.
