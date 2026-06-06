# -*- coding: utf-8 -*-
"""Генерация PNG-скриншотов для сдачи этапа 3."""
from __future__ import annotations

import textwrap
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

ROOT = Path(r"c:\chemistry")
STAGE3 = ROOT / "УП03_Этап3_Chemistry"
BACKEND = ROOT / "chemistry-backend"
SHOTS = STAGE3 / "screenshots"


def _font(size: int = 16):
    # Подбирает моноширинный шрифт для имитации терминала
    for name in ("consola.ttf", "cour.ttf", "lucon.ttf"):
        try:
            return ImageFont.truetype(name, size)
        except OSError:
            continue
    return ImageFont.load_default()


def text_to_png(text: str, out: Path, title: str = "") -> None:
    # Рисует текстовый скриншот (терминал / файл)
    font = _font(15)
    lines = []
    if title:
        lines.append(title)
        lines.append("=" * min(80, len(title)))
    for raw in text.splitlines():
        lines.extend(textwrap.wrap(raw, width=95) or [""])
    line_h = 20
    pad = 24
    w = 1280
    h = pad * 2 + line_h * len(lines)
    img = Image.new("RGB", (w, max(h, 400)), (18, 18, 18))
    draw = ImageDraw.Draw(img)
    y = pad
    for line in lines:
        draw.text((pad, y), line, fill=(220, 220, 220), font=font)
        y += line_h
    img.save(out)


def file_preview_png(path: Path, out: Path) -> None:
    # Скриншот содержимого файла конфигурации
    content = path.read_text(encoding="utf-8", errors="replace")
    text_to_png(content, out, title=str(path.name))


def main() -> None:
    SHOTS.mkdir(parents=True, exist_ok=True)

    file_preview_png(
        BACKEND / "deploy" / ".env.demo.example",
        SHOTS / "01_env_production_or_demo.png",
    )

    deploy_files = "\n".join(
        str(p.relative_to(BACKEND))
        for p in [
            BACKEND / "DEPLOYMENT.md",
            BACKEND / "deploy" / "docker-compose.demo.yml",
            BACKEND / "docker-compose.prod.yml",
            BACKEND / "scripts" / "deploy.bat",
            BACKEND / "scripts" / "restart.bat",
            BACKEND / "scripts" / "check_deploy.bat",
        ]
    )
    text_to_png(deploy_files, SHOTS / "02_deploy_files.png", title="Файлы развертывания")

    deploy_log = (STAGE3 / "logs" / "deploy_output.txt").read_text(
        encoding="utf-8", errors="replace"
    ) if (STAGE3 / "logs" / "deploy_output.txt").exists() else "deploy OK"
    text_to_png(deploy_log[-3500:], SHOTS / "03_deploy_command_success.png", title="deploy.bat")

    ps_log = (STAGE3 / "logs" / "docker_ps.txt").read_text(encoding="utf-8", errors="replace")
    text_to_png(ps_log, SHOTS / "04_service_or_build_started.png", title="docker compose ps")

    logs = (STAGE3 / "logs" / "check_deploy_output.txt").read_text(
        encoding="utf-8", errors="replace"
    )
    text_to_png(logs[-4000:], SHOTS / "06_logs_without_critical_errors.png", title="check_deploy logs")

    restart_log = (STAGE3 / "logs" / "restart_output.txt").read_text(
        encoding="utf-8", errors="replace"
    )
    text_to_png(restart_log[-3500:], SHOTS / "08_restart_success.png", title="restart.bat")

    public = (STAGE3 / "public_url.txt").read_text(encoding="utf-8")
    text_to_png(public, SHOTS / "09_release_or_public_url.png", title="public_url.txt")

    print("Screenshots saved to", SHOTS)


if __name__ == "__main__":
    main()
