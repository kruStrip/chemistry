@echo off
chcp 65001 > nul
cd /d "%~dp0\.."
call chemistry-backend\scripts\restart.bat
exit /b %ERRORLEVEL%
