@echo off
chcp 65001 > nul
cd /d "%~dp0\.."

echo ========================================
echo  Chemistry — логи Docker Compose
echo ========================================

cd chemistry-backend\deploy
docker compose logs -f
exit /b %ERRORLEVEL%
