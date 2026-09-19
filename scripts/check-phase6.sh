#!/usr/bin/env bash

set -u

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

FAIL=0

echo "=========================================="
echo " IE3142 - Phase 6 Architecture Validation"
echo "=========================================="

FILES=(
    "docs/architecture/runtime-architecture.md"
    "docs/architecture/data-flows.md"
    "docs/architecture/trust-boundaries.md"
    "docs/architecture/component-inventory.md"
)

for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "[OK] $file"
    else
        echo "[FAIL] $file missing"
        FAIL=1
    fi
done

echo
echo "Runtime services"
echo "----------------"

if docker compose config --services | grep -qx web; then
    echo "[OK] web service defined"
else
    echo "[FAIL] web service missing"
    FAIL=1
fi

if docker compose config --services | grep -qx mongo; then
    echo "[OK] mongo service defined"
else
    echo "[FAIL] mongo service missing"
    FAIL=1
fi

echo
echo "Application connectivity"
echo "------------------------"

if curl -s -o /dev/null http://127.0.0.1:4000/; then
    echo "[OK] NodeGoat reachable"
else
    echo "[FAIL] NodeGoat not reachable"
    FAIL=1
fi

if docker compose exec -T web \
    sh -c 'nc -z -w 2 mongo 27017' >/dev/null 2>&1; then
    echo "[OK] web -> mongo connectivity"
else
    echo "[FAIL] web cannot reach mongo"
    FAIL=1
fi

echo
echo "Baseline integrity"
echo "------------------"

if git diff --quiet vulnerable-baseline -- app; then
    echo "[OK] NodeGoat application remains unchanged"
else
    echo "[FAIL] NodeGoat source differs from vulnerable baseline"
    FAIL=1
fi

echo
echo "=========================================="

if [ "$FAIL" -eq 0 ]; then
    echo "PHASE 6 CHECK: PASSED"
else
    echo "PHASE 6 CHECK: FAILED"
fi

echo "=========================================="

exit "$FAIL"
