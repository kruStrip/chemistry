@echo off
chcp 65001 > nul
cd /d "%~dp0\.."

echo ========================================
echo  Chemistry — сборка release-архива demo
echo ========================================

set RELEASE_DIR=..\УП03_Этап3_Chemistry\release
if not exist "%RELEASE_DIR%" mkdir "%RELEASE_DIR%"

set STAGING=%TEMP%\chemistry_release_stage
if exist "%STAGING%" rmdir /s /q "%STAGING%"
mkdir "%STAGING%"

copy /Y "deploy\.env.demo.example" "%STAGING%\.env.demo.example" > nul
copy /Y "deploy\.env.production.example" "%STAGING%\.env.production.example" > nul
copy /Y "deploy\docker-compose.demo.yml" "%STAGING%\docker-compose.prod.yml" > nul
copy /Y "DEPLOYMENT.md" "%STAGING%\DEPLOYMENT.md" > nul
copy /Y "DEMO_GUIDE.md" "%STAGING%\DEMO_GUIDE.md" > nul
copy /Y "RELEASE_NOTES.md" "%STAGING%\RELEASE_NOTES.md" > nul
xcopy /E /I /Y "scripts\deploy.bat" "%STAGING%\scripts\" > nul
xcopy /E /I /Y "scripts\restart.bat" "%STAGING%\scripts\" > nul
xcopy /E /I /Y "scripts\check_deploy.bat" "%STAGING%\scripts\" > nul
copy /Y "%RELEASE_DIR%\demo_readme.txt" "%STAGING%\demo_readme.txt" > nul 2>nul

powershell -NoProfile -Command "Compress-Archive -Path '%STAGING%\*' -DestinationPath '%RELEASE_DIR%\project_release.zip' -Force"

echo Архив: %RELEASE_DIR%\project_release.zip
exit /b 0
