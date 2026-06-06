# PERFORMANCE_REPORT.md

Дата проверки: 06.06.2026

## Lighthouse (http://localhost:3000)

HTML-отчёт: `reports/lighthouse_report.html` (сгенерирован через `npx lighthouse`)

Категории: Performance, Accessibility, Best Practices (headless Chrome).

> JSON-экспорт прерван по таймауту DevTools на данной машине; оценки см. в HTML-отчёте.

## API latency

| Endpoint | Метод | Время (логи / curl) |
|----------|-------|---------------------|
| /health | GET | ~40–480 ms |
| /api/v1/courses | GET | ~1100 ms |
| /api/v1/reviews | GET | ~260–2700 ms |

Риск: тяжёлые EF-запросы с несколькими Include (см. WRN в логах api).

## k6

Скрипт: `tests/load/basic_load.js`  
Результат fallback: `reports/k6_summary.txt`

## Рекомендации

1. QuerySplittingBehavior для EF Core на списках с коллекциями.
2. Кэширование публичного каталога (Redis уже в стеке).
3. Lazy-load блоков отзывов на главной.
