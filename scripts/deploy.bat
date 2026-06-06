@echo off
chcp 65001 > nul
cd /d "%~dp0\.."
call chemistry-backend\scripts\deploy.bat
exit /b %ERRORLEVEL%
