@echo off
chcp 65001 > nul
cd /d "%~dp0\.."

echo ========================================
echo  Chemistry — развертывание demo-стенда
echo ========================================

if not exist "deploy\.env.demo" (
  echo Создаю deploy\.env.demo из примера...
  copy /Y "deploy\.env.demo.example" "deploy\.env.demo" > nul
)

cd deploy
docker compose -f docker-compose.demo.yml up --build -d
if errorlevel 1 exit /b 1

echo.
echo Статус контейнеров:
docker compose -f docker-compose.demo.yml ps
echo.
echo Frontend: http://localhost:3000
echo API:      http://localhost:5000/health
exit /b 0
