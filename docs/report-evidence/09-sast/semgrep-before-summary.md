# Semgrep Baseline (Vulnerable State)

**Date:** 2026-09-23
**Tool version:** `semgrep --version` (e.g., 1.x.x)
**Command:** `semgrep --config=auto app/app app/server.js`
**Total findings:** 23

## Findings by Severity

| Severity | Count |
|----------|-------|
| ERROR    | 5     |
| WARNING  | 17    |
| INFO     | 1     |

## Key Findings

| # | Rule | File | Line | Severity |
|---|------|------|------|----------|
| 1 | `code-string-concat` (Injection) | `app/app/routes/contributions.js` | 32 | ERROR |
| 2 | `code-string-concat` (Injection) | `app/app/routes/contributions.js` | 33 | ERROR |
| 3 | `code-string-concat` (Injection) | `app/app/routes/contributions.js` | 34 | ERROR |
| 4 | `eval-detected` | `app/app/routes/contributions.js` | 32 | WARNING |
| 5 | `eval-detected` | `app/app/routes/contributions.js` | 33 | WARNING |
| 6 | `eval-detected` | `app/app/routes/contributions.js` | 34 | WARNING |
| 7 | `express-cookie-session-no-secure` | `app/server.js` | 78 | WARNING |
| 8 | `express-cookie-session-no-httpOnly` | `app/server.js` | 78 | WARNING |
| 9 | `express-cookie-session-no-expires` | `app/server.js` | 78 | WARNING |
| 10| `express-cookie-session-no-domain` | `app/server.js` | 78 | WARNING |
| 11| `express-cookie-session-default-name` | `app/server.js` | 78 | WARNING |
| 12| `express-check-csrf-middleware-usage` | `app/server.js` | 15 | INFO |
| 13| `using-http-server` | `app/server.js` | 145 | WARNING |
| 14| `plaintext-http-link` | `app/app/views/tutorial/a5.html` | 51 | WARNING |
| 15| `plaintext-http-link` | `app/app/views/tutorial/a2.html` | 210 | WARNING |
| 16| `django-no-csrf-token`* | `app/app/views/memos.html` | 15 | WARNING |

*\*Note: The `django-no-csrf-token` rule is a generic HTML template rule that is matching the Node.js application's view templates. It appears to be a false positive regarding the framework, but it correctly identifies missing CSRF tokens in the HTML forms.*

## Notes

This baseline was captured against the unmodified NodeGoat application (commit `vulnerable-baseline`). No fixes have been applied. These findings will be compared after remediation in Phase 13.

**Summary of Key Issues:**
- **Injection (VULN-02):** The `contributions.js` file contains both `code-string-concat` (ERROR) and `eval-detected` (WARNING) on lines 32-34. This confirms the Server-Side JavaScript / NoSQL Injection threat (T2).
- **Weak Session Management (VULN-01):** The `server.js` file (line 78) has multiple session cookie configuration issues (missing `secure`, `httpOnly`, `expires`, etc.), confirming the Weak Session Management threat (T1).
- **Transport Security:** `server.js` (line 145) uses an insecure HTTP server.
- **CSRF:** The `express-check-csrf-middleware-usage` (INFO) and the HTML form warnings indicate missing CSRF protection across the application.
