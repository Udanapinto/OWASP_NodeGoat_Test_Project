# Threat-to-Vulnerability Mapping

## Phase 7 → Phase 8 Transition

| Threat ID | STRIDE Category | Threat Description | Confirmed Vulnerability | Owner | Jira Ticket |
|-----------|-----------------|-------------------|------------------------|-------|-------------|
| T1 | Spoofing | Account/Session Impersonation | VULN-01: Weak Session Management | Member 1 | NGDS-1 |
| T2 | Tampering | Injection | VULN-02: NoSQL Injection | Member 2 | NGDS-2 |
| T3 | Tampering | Stored XSS | VULN-03: Stored XSS | Member 3 | NGDS-3 |
| T4 | Elevation of Privilege | Broken Authorization | VULN-04: Broken Access Control | Member 4 | NGDS-4 |

## Confirmation Status

| Vulnerability | Confirmed | Exploit Reproduced | Evidence Captured |
|---------------|-----------|-------------------|-------------------|
| VULN-01 | ✅ | ✅ | ✅ |
| VULN-02 | ✅ | ✅ | ✅ |
| VULN-03 | ✅ | ✅ | ✅ |
| VULN-04 | ✅ | ✅ | ✅ |

## Vulnerability Ownership Freeze

The following assignments are now **frozen** for Phases 9–14:

- **VULN-01** → Member 1 (branch: `member1/vuln-01`)
- **VULN-02** → Member 2 (branch: `member2/vuln-02`)
- **VULN-03** → Member 3 (branch: `member3/vuln-03`)
- **VULN-04** → Member 4 (branch: `member4/vuln-04`)

No reassignment without group consensus and a new Jira ticket comment.



