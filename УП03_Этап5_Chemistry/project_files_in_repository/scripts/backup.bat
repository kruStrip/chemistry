@echo off
chcp 65001 > nul
cd /d "%~dp0\.."
set DEPLOY=C:\chemistry\chemistry-backend\deploy
set BACKUPS=%~dp0..\backups

if not exist "%BACKUPS%" mkdir "%BACKUPS%"

for /f "tokens=1-4 delims=/.: " %%a in ("%date% %time%") do set TS=%%c%%b%%a_%%d
set TS=%TS: =0%

echo === Backup PostgreSQL ===
python "%~dp0_resolve_pg_host.py" > "%BACKUPS%\_pg_host.txt" 2>nul
set /p PGHOST=<"%BACKUPS%\_pg_host.txt"
if "%PGHOST%"=="" set PGHOST=postgres

echo Host: %PGHOST%
for /f "usebackq tokens=1,* delims==" %%a in (`findstr /b "POSTGRES_PASSWORD=" "%DEPLOY%\.env"`) do set PGPASSWORD=%%b
set PGPASSWORD=%PGPASSWORD:"=%

docker compose -f "%DEPLOY%\docker-compose.yml" --env-file "%DEPLOY%\.env" exec -T -e PGPASSWORD=%PGPASSWORD% postgres pg_dump -h %PGHOST% -U chemistry_user chemistry_db > "%BACKUPS%\backup_%TS%.sql"

if %ERRORLEVEL% NEQ 0 (
  echo ERROR: pg_dump failed with code %ERRORLEVEL%
  exit /b 1
)

for %%F in ("%BACKUPS%\backup_%TS%.sql") do set SIZE=%%~zF
if %SIZE% LSS 1000 (
  echo ERROR: backup file too small (%SIZE% bytes^)
  exit /b 1
)

echo Backup created: backups\backup_%TS%.sql (%SIZE% bytes^)
exit /b 0
