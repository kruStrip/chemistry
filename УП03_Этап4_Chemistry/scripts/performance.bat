@echo off
chcp 65001 > nul
cd /d "%~dp0\.."
echo ========================================
echo Проверка производительности
echo ========================================
set URL=http://localhost:3000
set REPORT=%~dp0\..\reports\PERFORMANCE_REPORT.md

echo # Performance report > "%REPORT%"
echo Дата: %DATE% %TIME% >> "%REPORT%"
echo. >> "%REPORT%"

echo ## Lighthouse >> "%REPORT%"
where npx >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
  echo npx не найден, Lighthouse пропущен >> "%REPORT%"
  goto :k6
)
npx --yes lighthouse "%URL%" --only-categories=performance,accessibility,best-practices --output html --output-path "%~dp0\..\reports\lighthouse_report.html" --chrome-flags="--headless" --quiet 2>> "%REPORT%"
if %ERRORLEVEL% EQU 0 (
  echo Lighthouse HTML: reports\lighthouse_report.html >> "%REPORT%"
) else (
  echo Lighthouse: ошибка запуска, см. лог выше >> "%REPORT%"
)

:k6
echo. >> "%REPORT%"
echo ## k6 load test >> "%REPORT%"
where k6 >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
  echo k6 не установлен — использован curl-замер health >> "%REPORT%"
  curl -s -o nul -w "health TTFB: %%{time_starttransfer}ms total: %%{time_total}ms\n" http://localhost:5000/health >> "%REPORT%"
  goto :done
)
k6 run "%~dp0\..\tests\load\basic_load.js" > "%~dp0\..\reports\k6_summary.txt" 2>&1
type "%~dp0\..\reports\k6_summary.txt" >> "%REPORT%"

:done
echo.
echo Отчёт: %REPORT%
type "%REPORT%"
exit /b 0
