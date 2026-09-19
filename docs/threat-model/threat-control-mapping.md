# Threat-to-Control Mapping

## Owner

Member 1 — Project Leader

## Purpose

This document maps the Phase 7 threat model to planned secure-coding
and DevSecOps controls.

Controls listed as "planned" must not be described as implemented
until their implementation phase has been completed.

---

## T1 — Account / Session Impersonation

### Architecture

DF1 / TB1

### Planned Secure Coding Controls

- Stronger session lifecycle management
- Session identifier regeneration after authentication
- Session expiration
- HTTPOnly session-cookie configuration
- Generic authentication failure messages
- Stronger credential handling

### Planned Detection Controls

- Authentication security logging
- Failed-login audit events

### Pipeline Relationship

Member 1:

SAST / Semgrep

### Status

Planned

---

## T2 — Injection

### Architecture

DF1 + DF2

TB1 + TB2

### Planned Secure Coding Controls

- Remove unsafe evaluation of attacker-controlled data
- Enforce data-type validation
- Use safe parsing
- Avoid unsafe dynamic database expressions
- Server-side validation

### Planned Detection Controls

- Security audit logging
- SAST

### Pipeline Relationship

Member 1:

Semgrep

Member 2:

Dependency/SCA scanning where relevant

### Status

Planned

---

## T3 — Stored XSS

### Architecture

DF1 / TB1

### Planned Secure Coding Controls

- Context-aware output encoding
- Template auto-escaping
- Input validation where appropriate
- HTTPOnly session-cookie configuration
- Content Security Policy where practical

### Planned Detection Controls

- Security logging
- SAST
- Optional DAST

### Pipeline Relationship

Member 1:

Semgrep

### Status

Planned

---

## T4 — Broken Authorization

### Architecture

DF1 / TB1

### Planned Secure Coding Controls

- Server-side authorization
- Role checks
- Object-level authorization
- Ownership validation
- Deny-by-default access decisions

### Planned Detection Controls

- Authorization-failure audit logging
- Repeated forbidden-access monitoring

### Pipeline Relationship

Secure coding test coverage and SAST where detectable.

### Status

Planned

---

# Control Ownership

| Threat | Secure Coding Owner | Relevant Security Owner |
|---|---|---|
| T1 | Assigned vulnerability owner | Member 1 / Member 3 |
| T2 | Assigned vulnerability owner | Member 1 |
| T3 | Assigned vulnerability owner | Member 1 |
| T4 | Assigned vulnerability owner | Member 1 |

Final vulnerability ownership will follow the project division:

- Vulnerability 1 — Member 1
- Vulnerability 2 — Member 2
- Vulnerability 3 — Member 3
- Vulnerability 4 — Member 4

The exact T1–T4 → Vulnerability 1–4 assignment will be frozen only
after Phase 8 confirms the vulnerabilities against the pinned local
NodeGoat version.


