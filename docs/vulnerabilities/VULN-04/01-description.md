# VULN-04: Broken Access Control / IDOR

**STRIDE Threat:** T4 — Broken Object/Function Authorization  
**STRIDE Category:** Elevation of Privilege / Information Disclosure / Tampering  
**CWE:** CWE-639 (Authorization Bypass Through User-Controlled Key), CWE-862 (Missing Authorization)  
**OWASP:** A01:2021 — Broken Access Control  

## Description

The allocations route uses a user-controlled URL parameter (`/allocations/:userId`) instead of the session user ID, allowing any authenticated user to view any other user's allocations by changing the URL. Interestingly, the source code contains a comment indicating a fix was planned ("Fix for A4 Insecure DOR - take user id from session instead of URL param"), but the code still uses `req.params`. Additionally, the benefits route lacks an admin authorization check, allowing any logged-in user to access administrative functionality.

## Confirmation Status

- [x] Confirmed in pinned NodeGoat version
- [x] Reproducible via browser URL manipulation
- [ ] Fixed (Phase 14)

## Source Locations

- File: `app/app/routes/allocations.js` → route handler using `req.params.userId` (lines 16-18)
- File: `app/app/routes/index.js` → benefits route missing `isAdmin` middleware

## Evidence

- `01-idor-allocations-user1.png`
- `02-idor-allocations-admin.png`
- `03-benefits-unauthorised-access.png`
- `04-vulnerable-code-allocations.png`
- `05-vulnerable-code-benefits.png`

## Risk Rating (from Phase 7)

- Likelihood: 2 — Medium
- Impact: 3 — High
- Risk Score: 6 — High


