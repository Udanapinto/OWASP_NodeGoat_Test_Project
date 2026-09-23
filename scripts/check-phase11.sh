#!/usr/bin/env bash
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
FAIL=0

echo "========================================="
echo " IE3142 - Phase 11 Baseline Scan Check"
echo "========================================="

# Check SAST baseline
echo ""
echo "SAST baseline"
echo "-------------"
if [ -f "docs/report-evidence/09-sast/semgrep-before.json" ]; then
    echo "[OK] semgrep-before.json exists"
    COUNT=$(cat docs/report-evidence/09-sast/semgrep-before.json | jq '.results | length')
    echo "     Findings: $COUNT"
else
    echo "[FAIL] semgrep-before.json missing"
    FAIL=1
fi

# Check SCA baseline
echo ""
echo "SCA baseline"
echo "------------"
if [ -f "docs/report-evidence/10-sca/npm-audit-before.json" ]; then
    echo "[OK] npm-audit-before.json exists"
else
    echo "[FAIL] npm-audit-before.json missing"
    FAIL=1
fi

# Check secrets baseline
echo ""
echo "Secrets baseline"
echo "----------------"
if [ -f "docs/report-evidence/12-secrets/gitleaks-before.json" ]; then
    echo "[OK] gitleaks-before.json exists"
else
    echo "[FAIL] gitleaks-before.json missing"
    FAIL=1
fi

# Check Trivy baseline
echo ""
echo "Container baseline"
echo "------------------"
if [ -f "docs/report-evidence/12-trivy/trivy-before.json" ]; then
    echo "[OK] trivy-before.json exists"
else
    echo "[FAIL] trivy-before.json missing"
    FAIL=1
fi

# Verify app/ is unchanged
echo ""
echo "Application integrity"
echo "---------------------"
if git diff --quiet vulnerable-baseline -- app; then
    echo "[OK] app/ still matches vulnerable baseline"
else
    echo "[FAIL] app/ has been modified — baseline must remain unchanged"
    FAIL=1
fi

echo ""
echo "========================================="
if [ "$FAIL" -eq 0 ]; then
    echo "PHASE 11 CHECK: PASSED"
else
    echo "PHASE 11 CHECK: FAILED"
fi
echo "========================================="
exit "$FAIL"
