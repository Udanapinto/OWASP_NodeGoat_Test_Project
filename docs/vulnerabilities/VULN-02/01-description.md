# VULN-02: NoSQL Injection (Authentication Bypass)

**STRIDE Threat:** T2 — Injection  
**STRIDE Category:** Tampering / Elevation of Privilege  
**CWE:** CWE-943 (Improper Neutralization of Special Elements in Data Query Logic)  
**OWASP:** A03:2021 — Injection  

## Description

NodeGoat passes user-supplied input directly into MongoDB queries without type validation. An attacker can supply a JSON object such as `{"$gt": ""}` as the username or password. Because the application does not validate that the input is a string, the MongoDB query `findOne({ userName: userName })` interprets the injected object as a query operator, bypassing authentication entirely.

## Confirmation Status

- [x] Confirmed in pinned NodeGoat version
- [x] Reproducible via Burp Suite
- [ ] Fixed (Phase 12)

## Source Locations

- File: `app/app/data/user-dao.js` → `validateLogin()` function (lines 91-104)

## Evidence

- `01-login-injection-burp-request.png`
- `02-login-injection-success.png`
- `03-vulnerable-code-user-dao.png`

## Risk Rating (from Phase 7)

- Likelihood: 3 — High
- Impact: 3 — High
- Risk Score: 9 — Critical


