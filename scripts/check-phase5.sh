#!/usr/bin/env bash

set -u

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

FAIL=0

echo "============================================"
echo " IE3142 - Phase 5 Container Verification"
echo "============================================"
echo

echo "Docker"
echo "------"

if docker info >/dev/null 2>&1; then
    echo "[OK] Docker daemon accessible"
else
    echo "[FAIL] Docker unavailable"
    FAIL=1
fi

echo
echo "Compose configuration"
echo "---------------------"

if docker compose config >/dev/null 2>&1; then
    echo "[OK] docker-compose.yml valid"
else
    echo "[FAIL] Compose configuration invalid"
    FAIL=1
fi

echo
echo "Web container"
echo "-------------"

if docker compose ps --status running --services | grep -qx web; then
    echo "[OK] web container running"
else
    echo "[FAIL] web container not running"
    FAIL=1
fi

echo
echo "Mongo container"
echo "---------------"

if docker compose ps --status running --services | grep -qx mongo; then
    echo "[OK] MongoDB container running"
else
    echo "[FAIL] MongoDB container not running"
    FAIL=1
fi

echo
echo "Web -> MongoDB"
echo "--------------"

if docker compose exec -T web \
    sh -c 'nc -z -w 2 mongo 27017' >/dev/null 2>&1; then
    echo "[OK] NodeGoat can reach MongoDB"
else
    echo "[FAIL] NodeGoat cannot reach MongoDB"
    FAIL=1
fi

echo
echo "HTTP application"
echo "----------------"

HTTP_CODE=$(curl -s \
    -o /dev/null \
    -w "%{http_code}" \
    http://127.0.0.1:4000/)

if [[ "$HTTP_CODE" =~ ^(200|301|302|303)$ ]]; then
    echo "[OK] NodeGoat responding: HTTP $HTTP_CODE"
else
    echo "[FAIL] Unexpected HTTP status: $HTTP_CODE"
    FAIL=1
fi

echo
echo "Vulnerable application baseline"
echo "-------------------------------"

if git diff --quiet vulnerable-baseline -- app; then
    echo "[OK] Original NodeGoat source unchanged"
else
    echo "[FAIL] app/ differs from vulnerable-baseline"
    FAIL=1
fi

echo
echo "Security exposure"
echo "-----------------"

if docker compose port web 4000 | grep -q "127.0.0.1"; then
    echo "[OK] Web application bound to localhost"
else
    echo "[WARNING] Verify web service host binding"
fi

echo
echo "============================================"

if [ "$FAIL" -eq 0 ]; then
    echo "PHASE 5 CHECK: PASSED"
else
    echo "PHASE 5 CHECK: FAILED"
fi

echo "============================================"

exit "$FAIL"
