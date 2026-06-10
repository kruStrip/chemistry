# Карта команд Chemistry Backend (+ соседний chemistry-frontend)
.PHONY: setup run check test build release-check format docker-build docker-up docker-down logs clean help

FRONTEND_DIR := ../chemistry-frontend
DEPLOY_DIR := deploy

help:
	@echo "Chemistry Backend — команды:"
	@echo "  make setup        — dotnet restore + npm ci (frontend)"
	@echo "  make run          — npm run dev (frontend, API на :5000)"
	@echo "  make check        — format verify, build, tests, lint"
	@echo "  make test         — unit-тесты backend + frontend"
	@echo "  make build        — release-сборка backend и frontend"
	@echo "  make release-check — check + build перед релизом"
	@echo "  make format       — dotnet format + prettier"
	@echo "  make docker-up    — docker compose up --build"
	@echo "  make docker-down  — docker compose down"
	@echo "  make logs         — docker compose logs -f"

setup:
	dotnet restore Chemistry.sln
	@if [ ! -f $(DEPLOY_DIR)/.env ]; then cp $(DEPLOY_DIR)/.env.example $(DEPLOY_DIR)/.env; fi
	cd $(FRONTEND_DIR) && npm ci
	@if [ ! -f $(FRONTEND_DIR)/.env ]; then cp $(FRONTEND_DIR)/.env.example $(FRONTEND_DIR)/.env; fi

run:
	cd $(FRONTEND_DIR) && npm run dev

check:
	dotnet format src/Chemistry.Api/Chemistry.Api.csproj --verify-no-changes
	dotnet format src/Chemistry.Infrastructure/Chemistry.Infrastructure.csproj --verify-no-changes
	dotnet build Chemistry.sln -c Release
	dotnet test tests/Chemistry.UnitTests/Chemistry.UnitTests.csproj -c Release --no-build
	cd $(FRONTEND_DIR) && npm run lint && npm run typecheck && npm run test:run

test:
	dotnet test tests/Chemistry.UnitTests/Chemistry.UnitTests.csproj -c Release
	cd $(FRONTEND_DIR) && npm run test:run

build:
	dotnet build Chemistry.sln -c Release
	cd $(FRONTEND_DIR) && npm run build

release-check: check build
	@echo "Project is ready for release"

format:
	dotnet format Chemistry.sln
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
	dotnet clean Chemistry.sln
