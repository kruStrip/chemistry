# CHANGELOG.md

См. также `chemistry-backend/CHANGELOG.md` в репозитории.

## [0.1.1] - 2026-06-10

### Fixed

- Сообщение при неверном пароле на `/login` («Неверный email или пароль»).
- Login API client: не вызывает refresh при 401.

### Changed

- CI/CD скрипты и workflow `ci.yml`.
- Makefile: `test`, `build`, `release-check`.

### Verified

- `scripts\test.bat`, `make check`
- GitHub Actions passed
