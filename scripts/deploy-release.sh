#!/bin/bash
set -euo pipefail

APP_ROOT=/app/myapp
RELEASES_DIR="${APP_ROOT}/releases"
CURRENT_LINK="${APP_ROOT}/current"

TIMESTAMP=$(date +%Y%m%d-%H%M%S)

NEW_RELEASE="${RELEASES_DIR}/${TIMESTAMP}"

CODEDEPLOY_STAGING=/opt/codedeploy/cf-app

mkdir -p "${NEW_RELEASE}"

rsync -a --delete --exclude 'appspec.yml' --exclude 'scripts/' "${CODEDEPLOY_STAGING}/" "${NEW_RELEASE}/"

chown -R cf_svc:cf_svc "${NEW_RELEASE}"

ln -sfn "${NEW_RELEASE}" "${CURRENT_LINK}"

chown -h cf_svc:cf_svc "${CURRENT_LINK}"

echo "Deployment completed:"
echo "${NEW_RELEASE}"
