# PERFORMANCE_REPORT.md

Дата проверки: 06.06.2026

- **performance**: 0/100
- **accessibility**: 0/100
- **best-practices**: 0/100

- FCP: 10.4 s
- LCP: 55.1 s

## API latency (curl)
- GET /health: ~40–500 ms (demo Docker)

## k6
- Скрипт: `tests/load/basic_load.js` (требует установленный k6)
- Fallback: curl-замер в `scripts/performance.bat`

HTML-отчёт: `reports/lighthouse_report.html`