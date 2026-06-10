@echo off
chcp 65001 > nul
cd /d "%~dp0\.."

echo ========================================
echo  Chemistry — проверка готовности к релизу
echo ========================================

where make >nul 2>&1
if %ERRORLEVEL%==0 (
  make release-check
  exit /b %ERRORLEVEL%
)

call "%~dp0check.bat"
if errorlevel 1 exit /b 1
call "%~dp0build.bat"
if errorlevel 1 exit /b 1

echo release-check.bat — OK
exit /b 0
