@echo off
chcp 65001 > nul
cd /d "%~dp0\.."
echo ========================================
echo Проверка логов Docker (demo-стенд)
echo ========================================
set REPORT=%~dp0\..\reports\logs_tail.txt
set COMPOSE=%~dp0\..\..\chemistry-backend\deploy\docker-compose.demo.yml

docker compose -f "%COMPOSE%" logs --tail=100 api frontend > "%REPORT%" 2>&1
echo Логи сохранены: %REPORT%
findstr /i /c:"ERR" /c:"Exception" /c:"Traceback" /c:"FATAL" "%REPORT%" >nul
if %ERRORLEVEL% EQU 0 (
  echo [WARN] Найдены строки ERR/Exception — см. DEFECT_LOG и RISK_REGISTER
) else (
  echo [OK] Критических Traceback/FATAL не обнаружено
)
type "%REPORT%"
exit /b 0
