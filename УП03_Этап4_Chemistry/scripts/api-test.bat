@echo off
chcp 65001 > nul
cd /d "%~dp0\.."
echo ========================================
echo API smoke-тесты (curl)
echo ========================================
set API=http://localhost:5000
set REPORT=%~dp0\..\reports\api_test_output.txt

echo API smoke test %DATE% %TIME% > "%REPORT%"
echo. >> "%REPORT%"

call :check GET "%API%/health" 200
call :check GET "%API%/api/v1/courses" 200
call :check GET "%API%/api/v1/kits" 200
call :check GET "%API%/api/v1/reviews" 200
call :check POST "%API%/api/v1/auth/login" 401 "{\"email\":\"wrong@test.com\",\"password\":\"wrongpass\"}"
call :check GET "%API%/api/v1/courses/nonexistent-slug-99999" 404

echo.
echo Результаты сохранены в %REPORT%
type "%REPORT%"
exit /b 0

:check
set METHOD=%~1
set URL=%~2
set EXPECT=%~3
if /i "%METHOD%"=="GET" (
  curl -s -o "%TEMP%\api_body.json" -w "%%{http_code}" "%URL%" > "%TEMP%\api_code.txt"
) else (
  curl -s -o "%TEMP%\api_body.json" -w "%%{http_code}" -X %METHOD% "%URL%" -H "Content-Type: application/json" -d %~4 > "%TEMP%\api_code.txt"
)
set /p CODE=<"%TEMP%\api_code.txt"
echo [%METHOD%] %URL% -^> %CODE% (ожид. %EXPECT%) >> "%REPORT%"
echo [%METHOD%] %URL% -^> %CODE% (ожид. %EXPECT%)
type "%TEMP%\api_body.json" >> "%REPORT%"
echo. >> "%REPORT%"
exit /b 0
