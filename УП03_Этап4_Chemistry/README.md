# УП.03 — Этап 4: Chemistry Na Easy

Тестирование и диагностика качества demo-стенда после развёртывания (этап 3).

## Быстрый старт

```bat
cd chemistry-backend
scripts\deploy.bat

cd ..\УП03_Этап4_Chemistry
scripts\quality-check.bat
scripts\performance.bat
```

Открыть: http://localhost:3000

## Содержимое

| Путь | Описание |
|------|----------|
| `docs/TEST_PLAN.md` | 12 тест-кейсов UI/API/логи/perf |
| `docs/DEFECT_LOG.md` | 3 дефекта (1 исправлен) |
| `docs/RISK_REGISTER.md` | 7 рисков эксплуатации |
| `docs/QUALITY_REPORT.docx` | Итоговый отчёт этапа |
| `docs/API_TEST_REPORT.md` | Результаты API smoke |
| `docs/PERFORMANCE_REPORT.md` | Lighthouse / k6 |
| `scripts/` | test, api-test, quality-check, performance, logs-check |
| `reports/` | lighthouse, postman, логи, вывод тестов |
| `screenshots/` | 10 обязательных скриншотов |
| `tests/` | smoke, api, load (k6) |

## Связь с предыдущими этапами

- Этап 1: аудит, инструкция запуска → `УП03_Этап1_Chemistry`
- Этап 2: setup.bat, Makefile, Docker build → `УП03_Этап2_Chemistry`
- Этап 3: demo deploy, restart, check_deploy → `УП03_Этап3_Chemistry`
- **Этап 4:** проверка качества уже развёрнутого стенда (не повторяет deploy)
