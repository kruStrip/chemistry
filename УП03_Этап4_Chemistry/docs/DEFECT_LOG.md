# DEFECT_LOG.md

| ID | Где найдено | Описание проблемы | Как воспроизвести | Критичность | Статус | Исправление |
|----|-------------|-------------------|-------------------|-------------|--------|-------------|
| BUG-01 | UI / маршрутизация | Ссылка «Зарегистрироваться» вела на `/register`, но маршрут не был подключён в `router.tsx` — показывалась 404 | Открыть http://localhost:3000/login → клик «Зарегистрироваться» | Высокая | fixed | Добавлен `path: 'register'` и экспорт `RegisterPage` |
| BUG-02 | Frontend tests | Vitest на Windows нестабилен: таймаут worker или `Cannot read properties of undefined (reading 'config')` | `npm run test:run` в chemistry-frontend | Средняя | open | Базовая линия этапа 1: 60 passed; запускать в CI/Linux; см. `УП03_Этап1_Chemistry/logs/test_results.txt` |
| BUG-03 | UI / каталог | На чистой demo-БД список курсов пуст (`items: []`) — нет автосида | GET /api/v1/courses после deploy | Средняя | open | Запланирован seed/demo-данные для этапа эксплуатации |

### BUG-01: до / после

**До:** `GET http://localhost:3000/register` → страница 404 (NotFoundPage).  
**После:** отображается форма «Регистрация» с полями email, пароль, класс, школа.

Скриншот: `screenshots/09_defect_before_after.png`
