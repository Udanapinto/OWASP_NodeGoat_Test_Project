# VULN-01: Weak Session Management

**STRIDE Threat:** T1 — Account / Session Impersonation  
**STRIDE Category:** Spoofing / Information Disclosure  
**CWE:** CWE-614 (Missing Secure Flag), CWE-1004 (Missing HttpOnly Flag)  
**OWASP:** A05:2021 — Security Misconfiguration  

## Description

The NodeGoat session cookie is not configured with the `HttpOnly` and `Secure` flags. Without `HttpOnly`, client-side JavaScript can access the session cookie via `document.cookie`, meaning any XSS vulnerability (such as VULN-03) can be chained to steal the session token. Without `Secure`, the cookie is transmitted over HTTP in plaintext, allowing passive interception on untrusted networks.

## Confirmation Status

- [x] Confirmed in pinned NodeGoat version
- [x] Reproducible via Burp Suite / browser DevTools
- [ ] Fixed (Phase 11)

## Source Location

- File: `app/server.js`
- Approximate line: (record exact line from your inspection)
- Function: Express session middleware configuration

## Evidence

- `01-session-cookie-missing-flags.png`
- `02-vulnerable-code-session-config.png`
- `03-burp-response-headers.png`

## Risk Rating (from Phase 7)

- Likelihood: 3 — High
- Impact: 3 — High
- Risk Score: 9 — Critical
