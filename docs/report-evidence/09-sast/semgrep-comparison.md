# Semgrep Before/After Comparison

| Metric | Before (Vulnerable) | After (Fixed) |
| --- | --- | --- |
| Total findings | 26 | 22 |
| ERROR severity | 26 | 22 |
| WARNING severity | 0 | 0 |

## Resolved Findings

| # | Rule | File | Before | After |
| --- | --- | --- | --- | --- |
| 1 | Hardcoded session secret | server.js | Found | Resolved |
| 2 | eval() usage | contributions.js | Found | Resolved |
| 3 | XSS in profile | profile.js | Found | Resolved |
| 4 | Missing authorization | benefits.js | Found | Resolved |

## Remaining Findings

Based on the latest Semgrep scan (`semgrep-after.json`), there are **22 blocking findings** remaining across 44 scanned targets. 

*   **Scan Details:** 
    *   Rules run: 214
    *   Targets scanned: 44
    *   Parsed lines: ~99.2%
    *   Scan skipped: 15 files matching `.semgrepignore` patterns
    *   Scan was limited to files tracked by git
*   **Additional Notes:** 
    *   The remaining findings are likely other instances of similar vulnerabilities (e.g., hardcoded secrets, eval usage, missing authorization) in different files that were not addressed in this fix.
    *   Semgrep noted that 1856 pro rules were missed because the environment is not logged in. Running `semgrep login` and re-scanning could reveal additional findings.


