@echo off
chcp 65001 > nul
cd /d "%~dp0\.."

echo ========================================
echo  Chemistry — проверка развертывания
echo ========================================

cd deploy
echo --- docker compose ps ---
docker compose -f docker-compose.demo.yml ps
echo.
echo --- последние логи (80 строк) ---
docker compose -f docker-compose.demo.yml logs --tail=80
echo.
echo --- health API ---
curl -fsS http://localhost:5000/health
if errorlevel 1 (
  echo health check FAILED
  exit /b 1
)
echo.
echo check_deploy.bat — OK
exit /b 0
