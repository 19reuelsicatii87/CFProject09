#!/bin/bash
set -euo pipefail

CF_BIN=/opt/coldfusion2025/cfusion/bin
LOG_FILE=/var/log/coldfusion-restart.log

"${CF_BIN}/coldfusion" restart >>"$LOG_FILE" 2>&1
