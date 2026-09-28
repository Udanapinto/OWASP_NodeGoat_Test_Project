# Security Gate Policy

## Fail Conditions

| Gate | Tool | Fail On | Justification |
| --- | --- | --- | --- |
| SAST | Semgrep | ERROR severity | High-confidence security rules |
| SCA | npm audit | CRITICAL | Exploitable dependency issues |
| Secrets | Gitleaks | Any finding | Credential leakage is never acceptable |
| Container | Trivy | CRITICAL/HIGH (fixed) | Known exploits with available patches |

## Rationale

The thresholds are deliberately strict for secrets and SAST, and focused on
critical/high for SCA and container scanning. This balances security with
practicality: NodeGoat intentionally uses old dependencies, and some
base-image CVEs cannot be fixed without breaking the educational purpose.

## Override Procedure

In exceptional cases, a gate may be temporarily bypassed with:
1. A documented exception in the PR description
2. Approval from at least two group members
3. A follow-up ticket to remediate

This override must never be used for secrets scanning.
