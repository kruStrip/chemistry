@echo off
chcp 65001 > nul
cd /d "%~dp0\.."
call chemistry-backend\scripts\build_release.bat
exit /b %ERRORLEVEL%
