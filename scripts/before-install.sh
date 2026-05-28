#!/bin/bash
set -euo pipefail

APP_ROOT=/app/myapp

mkdir -p "${APP_ROOT}/releases"
mkdir -p "${APP_ROOT}/shared"

chown -R cf_svc:cf_svc "${APP_ROOT}"
chmod -R 755 "${APP_ROOT}"
