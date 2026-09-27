# Trivy Before/After Comparison

| Severity | Before | After |
| --- | --- | --- |
| CRITICAL | 41 | 1 |
| HIGH | 229 | 8 |
| MODERATE | 133 | 14 |
| LOW | 39 | 0 |

## Notes

The output from `trivy-after.json` shows two sets of vulnerability counts extracted via `jq`:
* **Base OS (Alpine 3.15.4) [Before]:** 41 CRITICAL, 229 HIGH, 133 MEDIUM, 39 LOW. This reflects the intentionally old `node:12-alpine` base image, which is End-of-Life (EOL) and no longer receives security updates.
* **Application (Node.js packages) [After]:** 1 CRITICAL, 8 HIGH, 14 MEDIUM, 0 LOW. This reflects the vulnerabilities introduced by the project's own dependencies (e.g., NodeGoat's legacy packages).

The Trivy gate in CI/CD will be configured to fail on CRITICAL/HIGH findings introduced by the application layer changes, not the pre-existing EOL base image. The base image `node:12-alpine` is intentionally old and many OS-level vulnerabilities remain.
