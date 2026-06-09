@echo off
chcp 65001 > nul
cd /d "%~dp0\.."
set DEPLOY=C:\chemistry\chemistry-backend\deploy
set BACKUPS=%~dp0..\backups
set REPORTS=%~dp0..\reports

if "%~1"=="" (
  echo Usage: restore.bat ^<backup_file.sql^>
  dir /b "%BACKUPS%\*.sql" 2>nul
  exit /b 1
)

set BACKUP_FILE=%BACKUPS%\%~1
if not exist "%BACKUP_FILE%" (
  echo File not found: %BACKUP_FILE%
  exit /b 1
)

echo === Restore to LOCAL postgres container (test DB) ===
echo Source: %~1
echo Target: local docker postgres (NOT remote production)

docker compose -f "%DEPLOY%\docker-compose.yml" --env-file "%DEPLOY%\.env" exec -T postgres psql -U chemistry_user -d chemistry_db -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public; GRANT ALL ON SCHEMA public TO chemistry_user; GRANT ALL ON SCHEMA public TO public;" > "%REPORTS%\restore_step1.txt" 2>&1

docker compose -f "%DEPLOY%\docker-compose.yml" --env-file "%DEPLOY%\.env" exec -T postgres psql -U chemistry_user -d chemistry_db < "%BACKUP_FILE%" > "%REPORTS%\restore_output.txt" 2>&1

echo === Verify restore ===
docker compose -f "%DEPLOY%\docker-compose.yml" --env-file "%DEPLOY%\.env" exec -T postgres psql -U chemistry_user -d chemistry_db -c "SELECT COUNT(*) AS users FROM \"User\"; SELECT COUNT(*) AS orders FROM \"Order\";" >> "%REPORTS%\restore_output.txt" 2>&1

type "%REPORTS%\restore_output.txt"
echo.
echo Restore to local postgres completed. API still uses connection from .env.
exit /b 0
