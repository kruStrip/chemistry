# RISK_REGISTER.md — УП.03 Этап 5, Chemistry Na Easy

Реестр эксплуатационных и security-рисков demo-стенда.

| Риск | Причина | Вероятность | Влияние | Мера снижения |
|------|---------|-------------|---------|---------------|
| Утечка `.env` | Файл случайно попал в Git | Средняя | Высокое | `.gitignore`, `.env.example`, `security-check.bat`, проверка `git status` |
| Доступ к чужим данным | Нет проверки владельца ресурса | Низкая* | Высокое | `OrdersController`: `order.UserId != UserId()` → 403; `AdminController` — только Admin |
| Уязвимая зависимость npm/dotnet | Старые транзитивные пакеты | Средняя | Среднее | `deps-check.bat`, регулярный `npm audit` / `dotnet list package --vulnerable` |
| Потеря данных PostgreSQL | Нет резервной копии | Низкая | Высокое | `backup.bat`, `restore.bat`, `postgres-backup.sh` на сервере |
| Сервис не поднимается после сбоя | Нет restart policy / мониторинга | Средняя | Среднее | `restart: unless-stopped` в demo compose, `check_deploy.bat`, логи |
| Открыт лишний порт БД/Redis | Проброс 5432/6379 на хост в dev-compose | Средняя | Среднее | На prod — только через nginx; закрыть порты firewall на сервере |
| CORS `AllowAnyOrigin` в Development | Удобство локальной разработки | Средняя | Среднее | В Production — явный whitelist; `ProductionConfigurationValidator` |
| Swagger на demo-стенде | `Swagger__Enabled=true` в demo | Низкая | Низкое | Отключить на публичном prod; ограничить доступ по VPN/IP |
| Нет HTTPS на localhost | Demo без TLS | Высокая (локально) | Низкое | Prod/staging — nginx + Let's Encrypt |
| JWT secret по умолчанию | `change_me` в шаблоне `.env.example` | Средняя | Высокое | Генерировать уникальный секрет при деплое; не коммитить реальный `.env` |

\* После проверки этапа 5: контроль владельца для заказов реализован; риск снижен до «низкая» при регресс-тестах.
