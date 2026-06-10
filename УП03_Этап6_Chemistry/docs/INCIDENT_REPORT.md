# INCIDENT_REPORT.md

## 1. Краткое описание

Пользователь не может понять причину отказа при входе: UI показывает «сессия истекла» вместо «неверный пароль».

## 2. Где обнаружено

- **Среда:** local Docker demo (frontend :3000, API :5000)
- **Компонент:** страница `/login`, `POST /api/v1/auth/login`

## 3. Как воспроизвести

1. `cd chemistry-backend && scripts\deploy.bat` (если стенд не поднят)
2. Открыть http://localhost:3000/login
3. Email: любой зарегистрированный или тестовый
4. Пароль: неверный
5. Отправить форму

## 4. Диагностика

| Источник | Наблюдение |
|----------|------------|
| DevTools → Network | `POST /api/v1/auth/login` → **401**, ProblemDetails `title: Invalid credentials` |
| DevTools → Console | Нет JS-ошибок; ошибка только в UI |
| API логи | `auth.login` не пишется при неверном пароле (ожидаемо) |
| Код frontend | `api/client.ts` — refresh при любом 401; `ui.tsx` — единый текст для 401 |
| Код backend | `AuthController.Login` — корректный 401, но без `detail` |

**Корневая причина:** неверная маппинг-логика сообщений на фронте + отсутствие `skipAuthRefresh` на login.

## 5. Влияние

- **Критичность:** средняя (функционал входа работает, UX вводит в заблуждение)
- **Пользователи:** все, кто ошибается в пароле
- **Поддержка:** лишние обращения «не могу войти, сессия слетела»

## 6. Исправление

| Файл | Изменение |
|------|-----------|
| `chemistry-frontend/src/api/resources.ts` | `skipAuthRefresh` + `omitAuthHeaders` для login |
| `chemistry-frontend/src/components/ui.tsx` | отдельное сообщение для `Invalid credentials` |
| `chemistry-backend/.../AuthController.cs` | `detail` на русском в 401 |
| `chemistry-frontend/src/components/ui.error-message.test.tsx` | регрессионный тест |

## 7. Проверка после исправления

```bat
cd chemistry-backend
scripts\test.bat
scripts\release-check.bat
curl -fsS http://localhost:5000/health
```

- Ручной сценарий: неверный пароль → «Неверный email или пароль»
- GitHub Actions: `ci.yml`, `backend.yml`, `frontend.yml`

## 8. Профилактика

- В PR-шаблоне указывать сценарии ошибок API
- Добавить в `release-check.bat` обязательный прогон перед тегом
- Документировать типовые коды ProblemDetails в `Documentation/Backend.md`
