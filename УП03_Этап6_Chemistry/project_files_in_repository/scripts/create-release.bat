@echo off
chcp 65001 > nul
cd /d "%~dp0\.."

echo ========================================
echo  Chemistry — подготовка релиза v0.1.1
echo ========================================

set VERSION=v0.1.1
set RELEASE_DIR=..\УП03_Этап6_Chemistry\release
if not exist "%RELEASE_DIR%" mkdir "%RELEASE_DIR%"

call "%~dp0release-check.bat"
if errorlevel 1 (
  echo release-check failed — релиз не создан
  exit /b 1
)

set STAGING=%TEMP%\chemistry_release_%VERSION%
if exist "%STAGING%" rmdir /s /q "%STAGING%"
mkdir "%STAGING%"

copy /Y "CHANGELOG.md" "%STAGING%\CHANGELOG.md" > nul
copy /Y "RELEASE_NOTES.md" "%STAGING%\RELEASE_NOTES.md" > nul
copy /Y "DEPLOYMENT.md" "%STAGING%\DEPLOYMENT.md" > nul
copy /Y "deploy\.env.demo.example" "%STAGING%\.env.demo.example" > nul
copy /Y "deploy\docker-compose.demo.yml" "%STAGING%\docker-compose.demo.yml" > nul
xcopy /E /I /Y "scripts\test.bat" "%STAGING%\scripts\" > nul
xcopy /E /I /Y "scripts\build.bat" "%STAGING%\scripts\" > nul
xcopy /E /I /Y "scripts\release-check.bat" "%STAGING%\scripts\" > nul
xcopy /E /I /Y "scripts\deploy.bat" "%STAGING%\scripts\" > nul
xcopy /E /I /Y "scripts\check_deploy.bat" "%STAGING%\scripts\" > nul

echo %VERSION%> "%STAGING%\VERSION.txt"
powershell -NoProfile -Command "Compress-Archive -Path '%STAGING%\*' -DestinationPath '%RELEASE_DIR%\chemistry_%VERSION%.zip' -Force"

echo Архив: %RELEASE_DIR%\chemistry_%VERSION%.zip
echo Тег для Git: %VERSION%
exit /b 0
