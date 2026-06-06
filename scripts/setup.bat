@echo off
chcp 65001 > nul
cd /d "%~dp0\.."

echo ========================================
echo  Chemistry — установка зависимостей
echo ========================================

echo.
echo [1/4] Backend: dotnet restore
cd chemistry-backend
dotnet restore Chemistry.sln
if errorlevel 1 goto :error
cd ..

echo.
echo [2/4] Backend: deploy/.env
if not exist "chemistry-backend\deploy\.env" (
  copy /Y "chemistry-backend\deploy\.env.example" "chemistry-backend\deploy\.env" > nul
  echo Создан chemistry-backend\deploy\.env — отредактируйте пароли и JWT_SECRET
)

echo.
echo [3/4] Frontend: npm ci
cd chemistry-frontend
call npm ci
set NPM_ERR=%ERRORLEVEL%
cd ..
if not %NPM_ERR%==0 goto :error

echo.
echo [4/4] Frontend: .env
if not exist "chemistry-frontend\.env" (
  copy /Y "chemistry-frontend\.env.example" "chemistry-frontend\.env" > nul
  echo Создан chemistry-frontend\.env
)

echo.
echo ========================================
echo  setup.bat — успешно
echo ========================================
echo Следующий шаг: scripts\docker-up.bat  или  scripts\run.bat
exit /b 0

:error
echo.
echo ОШИБКА при установке. Проверьте .NET 8 SDK и Node.js 20+.
exit /b 1
