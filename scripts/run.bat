@echo off
chcp 65001 > nul
cd /d "%~dp0\.."

echo ========================================
echo  Chemistry — локальный запуск frontend
echo ========================================

curl -s http://localhost:5000/health > nul 2>&1
if errorlevel 1 (
  echo API на порту 5000 не отвечает.
  echo Запустите полный стек: scripts\docker-up.bat
  echo Или поднимите только инфраструктуру в chemistry-backend\deploy
  pause
  exit /b 1
)

echo API доступен. Запуск Vite dev-сервера...
cd chemistry-frontend
call npm run dev
exit /b %ERRORLEVEL%
