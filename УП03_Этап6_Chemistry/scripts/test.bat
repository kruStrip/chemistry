@echo off
chcp 65001 > nul
cd /d "%~dp0\.."

echo ========================================
echo  Chemistry — тесты и проверки (make check)
echo ========================================

where make >nul 2>&1
if %ERRORLEVEL%==0 (
  make check
  exit /b %ERRORLEVEL%
)

call "%~dp0check.bat"
exit /b %ERRORLEVEL%
