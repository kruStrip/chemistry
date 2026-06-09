@echo off
chcp 65001 > nul
cd /d "%~dp0\.."
set ROOT=C:\chemistry
set REPORTS=%~dp0..\reports

if not exist "%REPORTS%" mkdir "%REPORTS%"

echo === Проверка подозрительных слов в проекте ===
echo [backend]
git -C "%ROOT%\chemistry-backend" grep -n -i -E "password|secret|token|api_key|apikey|jwt|smtp|database_url" -- . ":!docs" ":!Documentation" ":!tests" ":!*.md" ":!openapi.json" 2>nul
echo.
echo [frontend]
git -C "%ROOT%\chemistry-frontend" grep -n -i -E "password|secret|token|api_key|apikey|jwt|smtp|database_url" -- . ":!docs" ":!*.md" 2>nul
echo.
echo [root]
git -C "%ROOT%" grep -n -i -E "password|secret|token|api_key|apikey|jwt|smtp|database_url" -- . ":!docs" ":!screenshots" ":!reports" ":!УП03*" ":!*.md" ":!.env" 2>nul

echo === Проверка статуса Git (секреты не должны быть staged) ===
git -C "%ROOT%\chemistry-backend" status --short
git -C "%ROOT%\chemistry-frontend" status --short

echo.
echo Если найдены реальные пароли/токены — удалить их из проекта и заменить на .env.example.
echo Результат сохранён в reports\secret_scan.txt
(
  echo === Secret scan Chemistry ===
  echo Дата: %date% %time%
  echo.
  git -C "%ROOT%\chemistry-backend" grep -n -i -E "password|secret|token|api_key|apikey|jwt|smtp|database_url" -- . ":!docs" ":!Documentation" ":!tests" ":!*.md" ":!openapi.json" 2^>nul
  git -C "%ROOT%\chemistry-frontend" grep -n -i -E "password|secret|token|api_key|apikey|jwt|smtp|database_url" -- . ":!docs" ":!*.md" 2^>nul
) > "%REPORTS%\secret_scan.txt" 2>&1

exit /b 0
