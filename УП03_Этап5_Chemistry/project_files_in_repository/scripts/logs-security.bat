@echo off
chcp 65001 > nul
cd /d "%~dp0\.."
set DEPLOY=C:\chemistry\chemistry-backend\deploy
set REPORTS=%~dp0..\reports
if not exist "%REPORTS%" mkdir "%REPORTS%"

echo === Логи API (последние 80 строк) ===
docker compose -f "%DEPLOY%\docker-compose.yml" logs api --tail 80 > "%REPORTS%\logs_api.txt" 2>&1

echo === Логи postgres ===
docker compose -f "%DEPLOY%\docker-compose.yml" logs postgres --tail 40 >> "%REPORTS%\logs_api.txt" 2>&1

echo === Поиск критических ошибок ===
findstr /i /c:"fatal" /c:"traceback" /c:"Unhandled exception" "%REPORTS%\logs_api.txt" > "%REPORTS%\logs_critical_hits.txt" 2>nul
if %ERRORLEVEL% EQU 0 (
  echo Найдены потенциально критичные строки — см. logs_critical_hits.txt
  type "%REPORTS%\logs_critical_hits.txt"
) else (
  echo Критических fatal/traceback в хвосте логов не найдено.
)

type "%REPORTS%\logs_api.txt"
exit /b 0
