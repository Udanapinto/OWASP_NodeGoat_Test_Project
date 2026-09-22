#!/usr/bin/env bash

set -u

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

FAIL=0

echo "=============================================="
echo " IE3142 - Phase 8 Vulnerability Confirmation"
echo "=============================================="
echo

echo "Vulnerability documentation"
echo "----------------------------"

VULN_DIRS=(
  "docs/vulnerabilities/VULN-01"
  "docs/vulnerabilities/VULN-02"
  "docs/vulnerabilities/VULN-03"
  "docs/vulnerabilities/VULN-04"
)

for dir in "${VULN_DIRS[@]}"; do
  if [ -f "$dir/01-description.md" ]; then
    echo "[OK] $dir/01-description.md"
  else
    echo "[FAIL] $dir/01-description.md missing"
    FAIL=1
  fi
done

echo
echo "Evidence directories"
echo "---------------------"

EVIDENCE_DIRS=(
  "docs/report-evidence/05-vulnerability-01"
  "docs/report-evidence/06-vulnerability-02"
  "docs/report-evidence/07-vulnerability-03"
  "docs/report-evidence/08-vulnerability-04"
)

for dir in "${EVIDENCE_DIRS[@]}"; do
  if [ -d "$dir" ]; then
    echo "[OK] $dir exists"
  else
    echo "[FAIL] $dir missing"
    FAIL=1
  fi
done

echo
echo "Threat-to-vulnerability mapping"
echo "--------------------------------"

if [ -f "docs/vulnerabilities/THREAT-VULN-MAPPING.md" ]; then
  echo "[OK] THREAT-VULN-MAPPING.md exists"
else
  echo "[FAIL] THREAT-VULN-MAPPING.md missing"
  FAIL=1
fi

echo
echo "Baseline integrity"
echo "-------------------"

if git diff --quiet vulnerable-baseline -- app; then
  echo "[OK] NodeGoat source unchanged from vulnerable-baseline"
else
  echo "[FAIL] Application source has been modified!"
  FAIL=1
fi

echo
echo "=============================================="
if [ "$FAIL" -eq 0 ]; then
  echo "PHASE 8 CHECK: PASSED"
else
  echo "PHASE 8 CHECK: FAILED"
fi
echo "=============================================="

exit "$FAIL"
