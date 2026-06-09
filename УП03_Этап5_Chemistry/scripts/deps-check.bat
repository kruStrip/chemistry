@echo off
chcp 65001 > nul
cd /d "%~dp0\.."
set ROOT=C:\chemistry
set REPORTS=%~dp0..\reports
if not exist "%REPORTS%" mkdir "%REPORTS%"

echo === Проверка уязвимых зависимостей Chemistry ===
echo.

echo --- Frontend: npm audit ---
pushd "%ROOT%\chemistry-frontend"
call npm audit --audit-level=moderate > "%REPORTS%\npm_audit.txt" 2>&1
type "%REPORTS%\npm_audit.txt"
popd

echo.
echo --- Backend: dotnet list package --vulnerable ---
pushd "%ROOT%\chemistry-backend\src\Chemistry.Api"
dotnet list package --vulnerable --include-transitive > "%REPORTS%\dotnet_vulnerable.txt" 2>&1
type "%REPORTS%\dotnet_vulnerable.txt"
popd

echo.
echo Отчёты: reports\npm_audit.txt, reports\dotnet_vulnerable.txt
exit /b 0
