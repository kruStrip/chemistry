@echo off
chcp 65001 > nul
cd /d "%~dp0\.."

echo ========================================
echo  Chemistry — Docker Compose up --build
echo ========================================

if not exist "chemistry-backend\deploy\.env" (
  copy /Y "chemistry-backend\deploy\.env.example" "chemistry-backend\deploy\.env" > nul
  echo Создан deploy\.env — проверьте JWT_SECRET и пароли
)

cd chemistry-backend\deploy
docker compose up --build
exit /b %ERRORLEVEL%
