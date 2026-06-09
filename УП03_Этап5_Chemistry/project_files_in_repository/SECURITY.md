# Безопасность Chemistry Backend

## Секреты и конфигурация

- Реальные пароли, JWT, ключи API — только в `.env` / переменных окружения.
- В Git допускаются шаблоны: `deploy/.env.example`, `.env.demo.example`.
- Файлы `.env`, `secrets.json`, `appsettings.*.local.json` перечислены в `.gitignore`.

## Аутентификация и роли

- JWT (access + refresh), роли: `Student`, `Teacher`, `Parent`, `Admin`, `SuperAdmin`.
- Админ-эндпоинты (`/api/v1/admin/*`) — атрибут `[Authorize(Roles = Admin|SuperAdmin)]`.
- Заказы и платежи: проверка `order.UserId == текущий пользователь`, иначе `403 Forbidden`.

## CORS и production

- В **Development** без `Cors:AllowedOrigins` — `AllowAnyOrigin` (только для локальной разработки).
- В **Production** обязательны явные origins в `appsettings.Production.json`; wildcard `*` запрещён валидатором.
- Swagger в production отключён по умолчанию (`Swagger:Enabled=false`).

## Зависимости

```bash
dotnet list package --vulnerable --include-transitive
```

## Резервное копирование PostgreSQL

```bash
# Linux / сервер
deploy/scripts/postgres-backup.sh

# Windows / demo (УП.03 этап 5)
УП03_Этап5_Chemistry/scripts/backup.bat
```

## Сообщение об уязвимостях

Обнаружили проблему — опишите шаги воспроизведения и отправьте ответственному за репозиторий (без публикации exploit в issue).
