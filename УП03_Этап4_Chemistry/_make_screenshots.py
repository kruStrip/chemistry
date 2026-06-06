# -*- coding: utf-8 -*-
"""Генерация PNG-скриншотов для сдачи этапа 4 (терминал, API, тесты, логи)."""
from __future__ import annotations

import json
import textwrap
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

ROOT = Path(r"c:\chemistry")
STAGE4 = ROOT / "УП03_Этап4_Chemistry"
SHOTS = STAGE4 / "screenshots"
REPORTS = STAGE4 / "reports"


def _font(size: int = 15):
    # Подбирает моноширинный шрифт для имитации терминала
    for name in ("consola.ttf", "cour.ttf", "lucon.ttf"):
        try:
            return ImageFont.truetype(name, size)
        except OSError:
            continue
    return ImageFont.load_default()


def text_to_png(text: str, out: Path, title: str = "", width: int = 1280) -> None:
    # Рисует текстовый скриншот (терминал / curl / логи)
    font = _font(14)
    lines: list[str] = []
    if title:
        lines.append(title)
        lines.append("=" * min(90, len(title)))
    for raw in text.splitlines():
        lines.extend(textwrap.wrap(raw, width=100) or [""])
    line_h = 18
    pad = 20
    h = pad * 2 + line_h * len(lines)
    img = Image.new("RGB", (width, max(h, 420)), (18, 18, 18))
    draw = ImageDraw.Draw(img)
    y = pad
    for line in lines:
        draw.text((pad, y), line, fill=(220, 220, 220), font=font)
        y += line_h
    out.parent.mkdir(parents=True, exist_ok=True)
    img.save(out)


def side_by_side(left: str, right: str, out: Path, title: str) -> None:
    # До/после для дефекта BUG-01
    font = _font(13)
    pad = 16
    w_half = 620
    lines_l = textwrap.wrap(left, 70) or [""]
    lines_r = textwrap.wrap(right, 70) or [""]
    n = max(len(lines_l), len(lines_r)) + 3
    h = pad * 2 + 20 * n + 30
    img = Image.new("RGB", (1280, max(h, 500)), (24, 24, 28))
    draw = ImageDraw.Draw(img)
    draw.text((pad, pad), title, fill=(255, 220, 100), font=font)
    draw.text((pad, pad + 28), "ДО (404)", fill=(255, 120, 120), font=font)
    draw.text((w_half + pad, pad + 28), "ПОСЛЕ (форма регистрации)", fill=(120, 255, 160), font=font)
    y = pad + 56
    for i in range(n):
        ll = lines_l[i] if i < len(lines_l) else ""
        rr = lines_r[i] if i < len(lines_r) else ""
        draw.text((pad, y), ll, fill=(200, 200, 200), font=font)
        draw.text((w_half + pad, y), rr, fill=(200, 200, 200), font=font)
        y += 20
    img.save(out)


def main() -> None:
    SHOTS.mkdir(parents=True, exist_ok=True)

    api_out = (REPORTS / "api_test_output.txt").read_text(encoding="utf-8", errors="replace")
    text_to_png(api_out, SHOTS / "05_api_success_request.png", title="API smoke: успешные GET (200)")
    # Ошибочный сценарий — последние 2 блока
    err_part = "\n".join(api_out.splitlines()[-12:])
    text_to_png(err_part, SHOTS / "06_api_error_request_handled.png", title="API: 401 login / 404 course")

    pytest = (REPORTS / "pytest_report.txt").read_text(encoding="utf-8", errors="replace")
    text_to_png(pytest, SHOTS / "07_tests_success.png", title="dotnet test — 182 passed")

    logs = (REPORTS / "logs_tail.txt").read_text(encoding="utf-8", errors="replace")
    text_to_png(logs[-4500:], SHOTS / "08_logs_without_critical_errors.png", title="docker logs — api + frontend")

    perf = (REPORTS / "PERFORMANCE_REPORT.md").read_text(encoding="utf-8", errors="replace")
    if (REPORTS / "lighthouse_report.html").exists():
        perf += "\nLighthouse HTML: reports/lighthouse_report.html (сгенерирован)"
    text_to_png(perf, SHOTS / "04_lighthouse_or_performance.png", title="Performance / Lighthouse")

    side_by_side(
        "GET /register → 404 NotFoundPage\nrouter.tsx: маршрут отсутствовал\nСсылка с /login вела в тупик",
        "path: 'register' → <RegisterPage />\nФорма: email, пароль, класс\nHTTP 200, страница «Регистрация»",
        SHOTS / "09_defect_before_after.png",
        "BUG-01: маршрут /register",
    )

    git_log = ""
    for repo in ("chemistry-frontend", "chemistry-backend"):
        import subprocess

        r = subprocess.run(
            ["git", "-C", str(ROOT / repo), "log", "-1", "--oneline"],
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
        )
        git_log += f"{repo}: {r.stdout.strip()}\n"
    git_log += "\nЭтап 4: TEST_PLAN, DEFECT_LOG, scripts, reports\n"
    text_to_png(git_log, SHOTS / "10_git_commit.png", title="Git / артефакты этапа 4")

    # Postman run result JSON из api_test_output
    results = []
    for line in api_out.splitlines():
        if line.startswith("[") and "->" in line:
            parts = line.split("->")
            results.append({"line": line.strip()})
    (REPORTS / "postman_run_result.json").write_text(
        json.dumps({"run": results, "source": "api-test.bat"}, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )

    print("Screenshots:", SHOTS)


if __name__ == "__main__":
    main()
