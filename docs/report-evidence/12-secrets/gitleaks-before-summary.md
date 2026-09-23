# Gitleaks Baseline (Vulnerable State)

**Date:** 2026-09-23
**Command:** `gitleaks detect --source . --report-format json --report-path docs/report-evidence/12-secrets/gitleaks-before.json`
**Total findings:** 5

## Findings

| File | Line | Rule | Match |
|------|------|------|-------|
| `app/config/env/development.js` | 6 | generic-api-key | `ApiKey: "v9dn0balpqas1pcc281tn5ood1"` |
| `app/config/env/test.js` | 6 | generic-api-key | `ApiKey: "v9dn0balpqas1pcc281tn5ood1"` |
| `docs/report-evidence/10-sca/npm-audit-before.json` | 10546 | aws-access-token | `ASIAQGK6FURQSWWGDXHA` |
| `docs/report-evidence/10-sca/npm-audit-before.json` | 10546 | aws-access-token | `ASIAQGK6FURQSWWGDXHA` |
| `docs/report-evidence/10-sca/npm-audit-before.json` | 10546 | aws-access-token | `ASIAQGK6FURQSWWGDXHA` |

## Notes

This baseline was captured against the unmodified NodeGoat application.

- **Real Findings (2):** The `generic-api-key` found in `app/config/env/development.js` and `app/config/env/test.js` is a hardcoded API key belonging to NodeGoat. In Phase 14 (Secrets Management), we will move this to environment variables and GitHub Secrets.
- **False Positives (3):** The `aws-access-token` findings are false positives. They appear because Gitleaks scanned the `npm-audit-before.json` file, which contains example AWS tokens in its documentation text. In the CI/CD pipeline (Phase 14), we will configure Gitleaks to ignore the `docs/` directory to prevent these false positives from blocking the build.


