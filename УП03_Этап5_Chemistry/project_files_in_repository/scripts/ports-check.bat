@echo off
chcp 65001 > nul
cd /d "%~dp0\.."
set DEPLOY=C:\chemistry\chemistry-backend\deploy
set REPORTS=%~dp0..\reports
if not exist "%REPORTS%" mkdir "%REPORTS%"

echo === Docker-контейнеры и порты ===
docker compose -f "%DEPLOY%\docker-compose.yml" ps > "%REPORTS%\ports_docker.txt" 2>&1
type "%REPORTS%\ports_docker.txt"

echo.
echo === Порты Windows (LISTENING) ===
netstat -ano | findstr LISTENING > "%REPORTS%\ports_netstat.txt" 2>&1
type "%REPORTS%\ports_netstat.txt"

exit /b 0
