# VULN-03: Stored Cross-Site Scripting (XSS)

**STRIDE Threat:** T3 — Stored XSS  
**STRIDE Category:** Tampering / Information Disclosure / Spoofing  
**CWE:** CWE-79 (Improper Neutralization of Input During Web Page Generation)  
**OWASP:** A03:2021 — Injection  

## Description

NodeGoat's swig template engine is configured with `autoescape: false`, meaning user-supplied content is rendered directly into HTML without encoding. An attacker can store a JavaScript payload in their profile's `firstName` or `lastName` field, which executes in the browser of any user who views the profile. This can be chained with VULN-01 (missing HttpOnly flag) to steal session cookies.

## Confirmation Status

- [x] Confirmed in pinned NodeGoat version
- [x] Reproducible via browser and Burp Suite
- [ ] Fixed (Phase 13)

## Source Locations

- File: `app/server.js` → swig template engine configuration
- File: `app/app/routes/profile.js` → profile update handler

## Evidence

- `01-xss-payload-entered.png`
- `02-xss-alert-executed.png`
- `03-burp-profile-request.png`

## Risk Rating (from Phase 7)

- Likelihood: 3 — High
- Impact: 2 — Medium
- Risk Score: 6 — High
