@echo off
chcp 65001 > nul
cd /d "%~dp0\.."

echo ========================================
echo  Chemistry — форматирование кода
echo ========================================

echo.
echo [Backend] dotnet format
cd chemistry-backend
dotnet format Chemistry.sln
if errorlevel 1 goto :error
cd ..

echo.
echo [Frontend] npm run format
cd chemistry-frontend
call npm run format
if errorlevel 1 goto :error
cd ..

echo.
echo ========================================
echo  format.bat — успешно
echo ========================================
exit /b 0

:error
echo.
echo ОШИБКА форматирования.
exit /b 1
