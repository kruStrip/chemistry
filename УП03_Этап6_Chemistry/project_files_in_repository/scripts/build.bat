@echo off
chcp 65001 > nul
cd /d "%~dp0\.."

echo ========================================
echo  Chemistry — release-сборка
echo ========================================

set ERR=0

dotnet build Chemistry.sln -c Release
if errorlevel 1 set ERR=1

cd ..\chemistry-frontend
call npm run build
if errorlevel 1 set ERR=1

if %ERR%==0 (echo build.bat — OK) else (echo build.bat — ошибки)
exit /b %ERR%
