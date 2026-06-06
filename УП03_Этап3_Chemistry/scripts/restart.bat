@echo off
chcp 65001 > nul
cd /d "%~dp0\.."

echo ========================================
echo  Chemistry — перезапуск demo-стенда
echo ========================================

cd deploy
docker compose -f docker-compose.demo.yml down
if errorlevel 1 exit /b 1
docker compose -f docker-compose.demo.yml up --build -d
if errorlevel 1 exit /b 1

docker compose -f docker-compose.demo.yml ps
exit /b 0
