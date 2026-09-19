#!/usr/bin/env bash

set -u

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

FAIL=0

echo "============================================"
echo " IE3142 - Phase 4 Git Baseline Verification"
echo "============================================"
echo

echo "Git repository"
echo "--------------"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "[OK] Project Git repository detected"
else
    echo "[FAIL] Git repository not detected"
    exit 1
fi

echo
echo "Main branch"
echo "-----------"

if git show-ref --verify --quiet refs/heads/main; then
    echo "[OK] main exists"
else
    echo "[FAIL] main missing"
    FAIL=1
fi

echo
echo "Develop branch"
echo "--------------"

if git show-ref --verify --quiet refs/heads/develop; then
    echo "[OK] develop exists"
else
    echo "[FAIL] develop missing"
    FAIL=1
fi

echo
echo "Vulnerable baseline tag"
echo "-----------------------"

if git rev-parse --verify "vulnerable-baseline^{commit}" >/dev/null 2>&1; then
    echo "[OK] vulnerable-baseline exists"
else
    echo "[FAIL] vulnerable-baseline missing"
    FAIL=1
fi

echo
echo "Application integrity"
echo "---------------------"

if git diff --quiet vulnerable-baseline -- app; then
    echo "[OK] app/ still matches vulnerable baseline"
else
    echo "[FAIL] app/ differs from vulnerable baseline"
    FAIL=1
fi

echo
echo "Required documentation"
echo "----------------------"

FILES=(
    "docs/project/GIT_WORKFLOW.md"
    "docs/project/TEAM_OWNERSHIP.md"
    "docs/project/CONTRIBUTION_LOG.md"
    "docs/project/UPSTREAM_BASELINE.md"
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
echo "Remote repository"
echo "-----------------"

if git remote get-url origin >/dev/null 2>&1; then
    echo "[OK] origin configured"
    git remote get-url origin
else
    echo "[FAIL] origin missing"
    FAIL=1
fi

echo
echo "============================================"

if [ "$FAIL" -eq 0 ]; then
    echo "PHASE 4 CHECK: PASSED"
else
    echo "PHASE 4 CHECK: FAILED"
fi

echo "============================================"

exit "$FAIL"
