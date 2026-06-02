#!/bin/bash
set -euo pipefail

APP_ROOT=/app/myapp
RELEASES_DIR="${APP_ROOT}/releases"
CURRENT_LINK="${APP_ROOT}/current"
DIRECT_LINK="/opt/coldfusion2025/cfusion/wwwroot/myapp"

TIMESTAMP=$(date +%Y%m%d-%H%M%S)

NEW_RELEASE="${RELEASES_DIR}/${TIMESTAMP}"

CODEDEPLOY_STAGING=/opt/codedeploy/cf-app

mkdir -p "${NEW_RELEASE}"

rsync -a --delete --exclude 'appspec.yml' --exclude 'scripts/' "${CODEDEPLOY_STAGING}/" "${NEW_RELEASE}/"

chown -R cf_svc:cf_svc "${NEW_RELEASE}"
chmod -R 755 "${NEW_RELEASE}"

sudo tee /opt/coldfusion2025/cfusion/runtime/conf/Catalina/localhost/myapp.xml >/dev/null <<EOF
<Context
    docBase="${NEW_RELEASE}"
    reloadable="true"
    path="/myapp" />
EOF

echo "Created myapp.xml with docBase=${NEW_RELEASE}"

sudo ln -sfn "${NEW_RELEASE}" "${DIRECT_LINK}"
sudo chown -h cf_svc:cf_svc "${DIRECT_LINK}"

echo "Deployment completed:"
echo "${NEW_RELEASE}"
