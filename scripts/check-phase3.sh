#!/usr/bin/env bash

set -u

echo "========================================="
echo " IE3142 - Phase 3 Baseline Verification"
echo "========================================="
echo

FAIL=0

required_files=(
    "app/Dockerfile"
    "app/docker-compose.yml"
    "app/package.json"
    "app/package-lock.json"
    "app/server.js"
    "app/LICENSE"
    "app/README.md"
    "docs/project/UPSTREAM_BASELINE.md"
    "docs/project/nodegoat-upstream.env"
    "SECURITY.md"
)

echo "Required files"
echo "--------------"

for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "[OK] $file"
    else
        echo "[FAIL] $file missing"
        FAIL=1
    fi
done

echo
echo "Nested Git repository"
echo "---------------------"

if find app -name .git -type d | grep -q .; then
    echo "[FAIL] Nested .git directory detected inside app/"
    FAIL=1
else
    echo "[OK] No nested Git repository"
fi

echo
echo "Upstream metadata"
echo "-----------------"

if grep -q '^NODEGOAT_COMMIT=' docs/project/nodegoat-upstream.env; then
    echo "[OK] Upstream commit recorded"
else
    echo "[FAIL] Upstream commit missing"
    FAIL=1
fi

if grep -q '^NODEGOAT_REPOSITORY=' docs/project/nodegoat-upstream.env; then
    echo "[OK] Upstream repository recorded"
else
    echo "[FAIL] Repository metadata missing"
    FAIL=1
fi

echo
echo "Docker files"
echo "------------"

if [ -f app/Dockerfile ] && [ -f app/docker-compose.yml ]; then
    echo "[OK] Original NodeGoat Docker configuration preserved"
else
    echo "[FAIL] Docker configuration incomplete"
    FAIL=1
fi

echo
echo "Git repository"
echo "--------------"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "[OK] Parent project is a Git repository"
else
    echo "[FAIL] Parent project Git repository missing"
    FAIL=1
fi

echo
echo "========================================="

if [ "$FAIL" -eq 0 ]; then
    echo "PHASE 3 CHECK: PASSED"
else
    echo "PHASE 3 CHECK: FAILED"
fi

echo "========================================="

exit "$FAIL"
