# npm audit Baseline (Vulnerable State)

**Date:** 2026-09-23
**Command:** `docker compose exec -T web npm audit --json`
**Total vulnerabilities:** 838

## Severity Breakdown

| Severity | Count |
|----------|-------|
| Critical | 84    |
| High     | 481   |
| Moderate | 222   |
| Low      | 51    |

## Critical / High Vulnerabilities (Sample)

| Package | Severity | Issue |
|---------|----------|-------|
| lodash  | Critical | Prototype Pollution |
| mongoose| High     | Multiple issues |
| ...     | ...      | ...   |

*(You can list a few prominent packages here. It's not necessary to list all 481.)*

## Notes

NodeGoat uses deliberately old dependencies (e.g., `node:12-alpine` base image and old npm packages). These 838 findings are expected and confirm the application is intentionally insecure. They will be addressed in the CI/CD pipeline's SCA gate (Phase 14). The baseline will be compared after any dependency updates.
