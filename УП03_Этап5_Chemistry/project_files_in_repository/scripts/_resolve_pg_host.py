# -*- coding: utf-8 -*-
"""Определяет хост PostgreSQL из deploy/.env для backup/restore."""
from __future__ import annotations

import re
from pathlib import Path

ENV = Path(r"C:\chemistry\chemistry-backend\deploy\.env")
text = ENV.read_text(encoding="utf-8", errors="replace") if ENV.exists() else ""

for key in ("ConnectionStrings__Postgres", "POSTGRES_CONNECTION_STRING", "REMOTE_POSTGRES_CONNECTION_STRING"):
    m = re.search(rf"{re.escape(key)}=(.+)", text)
    if not m:
        continue
    val = m.group(1).strip().strip('"')
    host = re.search(r"Host=([^;]+)", val, re.I)
    if host:
        print(host.group(1))
        raise SystemExit(0)

print("postgres")
