# Единая карта команд проекта Chemistry (Windows: используйте scripts\*.bat или make через Git Bash/MSYS)
.PHONY: setup run check format docker-build docker-up docker-down logs clean help

BACKEND_DIR := chemistry-backend
FRONTEND_DIR := chemistry-frontend
DEPLOY_DIR := $(BACKEND_DIR)/deploy

help:
	@echo "Chemistry — доступные команды:"
	@echo "  make setup        — установка зависимостей backend + frontend"
	@echo "  make run          — локальный запуск frontend (API должен быть на :5000)"
	@echo "  make check        — линтеры, формат-проверка, тесты"
	@echo "  make format       — форматирование кода"
	@echo "  make docker-build — сборка Docker-образов"
	@echo "  make docker-up    — docker compose up --build"
	@echo "  make docker-down  — остановка контейнеров"
	@echo "  make logs         — просмотр логов compose"
	@echo "  make clean        — очистка артефактов сборки"

setup:
	@echo "=== Backend: dotnet restore ==="
	cd $(BACKEND_DIR) && dotnet restore Chemistry.sln
	@if [ ! -f $(DEPLOY_DIR)/.env ]; then cp $(DEPLOY_DIR)/.env.example $(DEPLOY_DIR)/.env; echo "Создан $(DEPLOY_DIR)/.env"; fi
	@echo "=== Frontend: npm ci ==="
	cd $(FRONTEND_DIR) && npm ci
	@if [ ! -f $(FRONTEND_DIR)/.env ]; then cp $(FRONTEND_DIR)/.env.example $(FRONTEND_DIR)/.env; echo "Создан $(FRONTEND_DIR)/.env"; fi

run:
	@echo "=== Запуск frontend dev-сервера ==="
	@echo "Убедитесь, что API доступен: http://localhost:5000/health"
	@echo "Если нет — выполните: make docker-up"
	cd $(FRONTEND_DIR) && npm run dev

check:
	@echo "=== Backend: dotnet format verify + build + unit tests ==="
	cd $(BACKEND_DIR) && dotnet format src/Chemistry.Api/Chemistry.Api.csproj --verify-no-changes
	cd $(BACKEND_DIR) && dotnet format src/Chemistry.Infrastructure/Chemistry.Infrastructure.csproj --verify-no-changes
	cd $(BACKEND_DIR) && dotnet build Chemistry.sln -c Release --no-restore 2>/dev/null || dotnet build Chemistry.sln -c Release
	cd $(BACKEND_DIR) && dotnet test tests/Chemistry.UnitTests/Chemistry.UnitTests.csproj -c Release --no-build
	@echo "=== Frontend: lint + typecheck + tests ==="
	cd $(FRONTEND_DIR) && npm run lint
	cd $(FRONTEND_DIR) && npm run typecheck
	cd $(FRONTEND_DIR) && npm run test:run

format:
	@echo "=== Backend: dotnet format ==="
	cd $(BACKEND_DIR) && dotnet format Chemistry.sln
	@echo "=== Frontend: prettier ==="
	cd $(FRONTEND_DIR) && npm run format

docker-build:
	cd $(DEPLOY_DIR) && docker compose build

docker-up:
	cd $(DEPLOY_DIR) && docker compose up --build

docker-down:
	cd $(DEPLOY_DIR) && docker compose down

logs:
	cd $(DEPLOY_DIR) && docker compose logs -f

clean:
	cd $(BACKEND_DIR) && dotnet clean Chemistry.sln
	@if [ -d $(FRONTEND_DIR)/dist ]; then rm -rf $(FRONTEND_DIR)/dist; fi
