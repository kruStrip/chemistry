# -*- coding: utf-8 -*-
"""Подготовка артефактов сдачи УП.03 этап 3."""
from __future__ import annotations

import shutil
import subprocess
from pathlib import Path

ROOT = Path(r"c:\chemistry")
STAGE3 = ROOT / "УП03_Этап3_Chemistry"
BACKEND = ROOT / "chemistry-backend"


def ensure_dirs() -> None:
    # Создаёт структуру папок для сдачи этапа 3
    for sub in (
        "logs",
        "screenshots",
        "docs",
        "scripts",
        "release",
        "release/screenshots",
        "project_files_in_repository/nginx",
    ):
        (STAGE3 / sub).mkdir(parents=True, exist_ok=True)


def copy_files() -> None:
    # Копирует обязательные файлы в папку сдачи
    (STAGE3 / "repo_link.txt").write_text(
        "https://github.com/Studio-Kairos/chemistry-backend.git\n"
        "https://github.com/Studio-Kairos/chemistry-frontend.git\n",
        encoding="utf-8",
    )
    (STAGE3 / "public_url.txt").write_text(
        "Demo-стенд (Docker, локально):\n"
        "- Frontend: http://localhost:3000\n"
        "- API Health: http://localhost:5000/health\n"
        "- Swagger: http://localhost:5000/swagger\n",
        encoding="utf-8",
    )

    for name in ("DEPLOYMENT.md", "DEMO_GUIDE.md", "RELEASE_NOTES.md"):
        shutil.copy2(BACKEND / name, STAGE3 / "docs" / name)
        shutil.copy2(BACKEND / name, STAGE3 / "project_files_in_repository" / name)

    pf = STAGE3 / "project_files_in_repository"
    shutil.copy2(BACKEND / "deploy" / ".env.demo.example", pf / ".env.demo.example")
    shutil.copy2(
        BACKEND / "deploy" / ".env.production.example", pf / ".env.production.example"
    )
    shutil.copy2(
        BACKEND / "deploy" / "docker-compose.demo.yml", pf / "docker-compose.prod.yml"
    )
    shutil.copy2(BACKEND / "deploy" / "nginx" / "demo.conf", pf / "nginx" / "project.conf")

    for script in ("deploy.bat", "restart.bat", "check_deploy.bat", "build_release.bat"):
        shutil.copy2(BACKEND / "scripts" / script, STAGE3 / "scripts" / script)

    (STAGE3 / "release" / "demo_readme.txt").write_text(
        "Chemistry Na Easy — demo release (УП.03 этап 3)\n\n"
        "1. Клонируйте chemistry-backend и chemistry-frontend в соседние папки.\n"
        "2. cd chemistry-backend && scripts\\deploy.bat\n"
        "3. Откройте http://localhost:3000\n\n"
        "Подробнее: DEPLOYMENT.md\n",
        encoding="utf-8",
    )


def capture_logs() -> None:
    # Сохраняет вывод deploy/check/restart в logs/
    logs = STAGE3 / "logs"
    deploy_cmd = ["cmd", "/c", str(BACKEND / "scripts" / "deploy.bat")]
    (logs / "deploy_output.txt").write_text(
        subprocess.check_output(deploy_cmd, cwd=BACKEND, text=True, errors="replace"),
        encoding="utf-8",
    )
    ps_cmd = [
        "docker",
        "compose",
        "-f",
        "docker-compose.demo.yml",
        "ps",
    ]
    (logs / "docker_ps.txt").write_text(
        subprocess.check_output(ps_cmd, cwd=BACKEND / "deploy", text=True, errors="replace"),
        encoding="utf-8",
    )


def build_release_zip() -> None:
    # Собирает project_release.zip для варианта release/demo
    subprocess.check_call(
        ["cmd", "/c", str(BACKEND / "scripts" / "build_release.bat")], cwd=BACKEND
    )


if __name__ == "__main__":
    ensure_dirs()
    copy_files()
    capture_logs()
    build_release_zip()
    print("Stage 3 artifacts ready:", STAGE3)
