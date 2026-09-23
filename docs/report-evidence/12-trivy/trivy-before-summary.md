# Trivy Baseline (Vulnerable State)

**Date:** 2026-09-23
**Image:** nodegoat-devsecops-web:latest
**Command:** `trivy image nodegoat-devsecops-web:latest`
**Total vulnerabilities:** 109

## Severity Breakdown

| Severity | Count |
|----------|-------|
| Critical | 13    |
| High     | 69    |
| Medium   | 14    |
| Low      | 13    |

## Notes

The NodeGoat base image uses `node:12-alpine`, which is intentionally old. Many vulnerabilities are in the base OS and Node.js runtime. The CI/CD Trivy gate will be configured to fail on critical/high findings, but for the baseline we simply record them.

*(Note: The 109 total is derived from summing the two result sets from the jq command: CRITICAL 1+12=13, HIGH 8+61=69, MEDIUM 14, LOW 13).*


