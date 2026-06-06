# Makefile: этап 4 — тестирование и диагностика качества Chemistry
.PHONY: test api-test quality-check performance logs-check

test:
	@scripts\test.bat

api-test:
	@scripts\api-test.bat

quality-check: test api-test logs-check
	@echo Quality check completed

performance:
	@scripts\performance.bat

logs-check:
	@scripts\logs-check.bat
