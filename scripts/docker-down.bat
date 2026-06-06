@echo off
chcp 65001 > nul
cd /d "%~dp0\.."

echo ========================================
echo  Chemistry — Docker Compose down
echo ========================================

cd chemistry-backend\deploy
docker compose down
exit /b %ERRORLEVEL%
