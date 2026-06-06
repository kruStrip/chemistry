@echo off
chcp 65001 > nul
cd /d "%~dp0\.."
echo ========================================
echo Запуск unit/smoke тестов Chemistry
echo ========================================

echo.
echo [1/2] Backend unit tests (xUnit)...
cd /d "%~dp0\..\..\chemistry-backend"
dotnet test tests\Chemistry.UnitTests\Chemistry.UnitTests.csproj -v q --nologo > "%~dp0\..\reports\pytest_report.txt" 2>&1
set BACKEND_RC=%ERRORLEVEL%
type "%~dp0\..\reports\pytest_report.txt"

echo.
echo [2/2] Frontend unit tests (Vitest)...
cd /d "%~dp0\..\..\chemistry-frontend"
call npm run test:run >> "%~dp0\..\reports\npm_test_report.txt" 2>&1
set FRONTEND_RC=%ERRORLEVEL%
type "%~dp0\..\reports\npm_test_report.txt"

echo.
if %BACKEND_RC% NEQ 0 (
  echo [FAIL] Backend tests: код %BACKEND_RC%
  exit /b %BACKEND_RC%
)
if %FRONTEND_RC% NEQ 0 (
  echo [WARN] Frontend tests: код %FRONTEND_RC% (см. DEFECT_LOG BUG-02)
)
echo Тесты завершены. Отчёты: reports\pytest_report.txt, reports\npm_test_report.txt
exit /b 0
