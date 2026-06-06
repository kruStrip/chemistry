@echo off
chcp 65001 > nul
cd /d "%~dp0\.."

echo ========================================
echo  Chemistry — проверка качества
echo ========================================

set ERR=0

echo.
echo [Backend] dotnet build + test
cd chemistry-backend
dotnet build Chemistry.sln -c Release
if errorlevel 1 set ERR=1

echo.
echo [Backend] dotnet test (UnitTests)
dotnet test tests/Chemistry.UnitTests/Chemistry.UnitTests.csproj -c Release --no-build
if errorlevel 1 set ERR=1
cd ..

echo.
echo [Frontend] npm run lint
cd chemistry-frontend
call npm run lint
if errorlevel 1 set ERR=1

echo.
echo [Frontend] npm run typecheck
call npm run typecheck
if errorlevel 1 set ERR=1

echo.
echo [Frontend] npm run test:run
call npx vitest run --pool=threads --maxWorkers=2
if errorlevel 1 set ERR=1
cd ..

echo.
if %ERR%==0 (
  echo ========================================
  echo  check.bat — все проверки пройдены
  echo ========================================
  exit /b 0
) else (
  echo ========================================
  echo  check.bat — есть ошибки
  echo ========================================
  exit /b 1
)
