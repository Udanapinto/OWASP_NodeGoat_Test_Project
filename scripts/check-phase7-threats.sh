#!/usr/bin/env bash

set -u

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

FAIL=0

REGISTER="docs/threat-model/stride-risk-register.md"

echo "======================================"
echo " IE3142 Phase 7 Threat Model Check"
echo "======================================"

FILES=(
    "docs/threat-model/risk-methodology.md"
    "docs/threat-model/stride-risk-register.md"
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
echo "Threat count"
echo "------------"

for threat in T1 T2 T3 T4; do
    if grep -q "## $threat —" "$REGISTER"; then
        echo "[OK] $threat present"
    else
        echo "[FAIL] $threat missing"
        FAIL=1
    fi
done

if grep -q "T5" "$REGISTER"; then
    echo "[WARNING] Additional threat T5 detected"
fi

echo
echo "Architecture dependency"
echo "-----------------------"

if [ -f "docs/architecture/runtime-architecture.md" ]; then
    echo "[OK] Architecture exists"
else
    echo "[FAIL] Architecture missing"
    FAIL=1
fi

echo
echo "Baseline integrity"
echo "------------------"

if git diff --quiet vulnerable-baseline -- app; then
    echo "[OK] Application source remains unchanged"
else
    echo "[FAIL] Application source has changed"
    FAIL=1
fi

echo
echo "======================================"

if [ "$FAIL" -eq 0 ]; then
    echo "PHASE 7 THREAT CHECK: PASSED"
else
    echo "PHASE 7 THREAT CHECK: FAILED"
fi

exit "$FAIL"
