# Smoke-checklist (fullstack demo)

- [x] Demo-стенд поднят: `docker compose -f deploy/docker-compose.demo.yml up -d`
- [x] Frontend открывается: http://localhost:3000
- [x] Health API: http://localhost:5000/health → 200
- [x] Swagger: http://localhost:5000/swagger
- [x] Главная страница без критических ошибок в Console
- [x] Network: запросы к `/api/v1/*` возвращают 200/401/404
- [x] Страница `/login` доступна
- [x] Страница `/register` доступна (исправлено BUG-01)
- [x] Backend unit: 182 passed
- [x] Frontend unit: 53+ passed (см. BUG-02 при таймауте worker)
