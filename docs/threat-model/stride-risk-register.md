# STRIDE Threat and Risk Register

## Owner

Member 2

## Scope

Architecture:

Local Browser
    ↓
NodeGoat Web Container
    ↓
MongoDB Container

This register contains exactly four application-specific threat
scenarios.

Actual exploit confirmation will occur during later vulnerability
testing.

---

## T1 — Account / Session Impersonation

### STRIDE Category

Primary:

Spoofing

Secondary:

Information Disclosure

### Asset

- User identity
- Authenticated session
- User account data

### Entry Point

- Login functionality
- Session cookie

### Threat Scenario

An attacker obtains or abuses authentication/session information and
acts as another NodeGoat user.

Weak session lifecycle controls or weak authentication handling may
increase the likelihood of successful impersonation.

### Architecture Relationship

DF1:

Browser → NodeGoat

TB1:

User → Application boundary

### Likelihood

3 — High

### Impact

3 — High

### Risk Score

9

### Risk Rating

Critical

### Validation Status

Candidate threat — requires local confirmation.

---

## T2 — Injection Affecting Application or Database Processing

### STRIDE Category

Primary:

Tampering

Secondary:

Elevation of Privilege / Denial of Service

### Asset

- NodeGoat application process
- MongoDB data
- Application availability

### Entry Point

Application-controlled form/query input.

Candidate areas include contribution and allocation processing.

### Threat Scenario

Attacker-controlled input reaches an unsafe interpreter, expression,
or database query mechanism.

This may allow unintended application logic, unauthorized data
retrieval/manipulation or resource exhaustion.

### Architecture Relationship

DF1:

Browser → NodeGoat

and

DF2:

NodeGoat → MongoDB

### Trust Boundaries

TB1 and TB2

### Likelihood

3 — High

### Impact

3 — High

### Risk Score

9

### Risk Rating

Critical

### Validation Status

Candidate threat — requires local confirmation.

---

## T3 — Stored Cross-Site Scripting Through Profile Data

### STRIDE Category

Primary:

Tampering

Secondary:

Information Disclosure / Spoofing

### Asset

- User browser session
- User identity
- Displayed application content

### Entry Point

Profile/user-controlled fields.

### Threat Scenario

Attacker-controlled content is stored by the application and later
rendered in another application response without appropriate
context-aware output encoding.

The victim's browser could execute attacker-controlled script.

### Architecture Relationship

DF1:

Browser → NodeGoat → Browser

TB1:

User → Application boundary

### Likelihood

3 — High

### Impact

2 — Medium

### Risk Score

6

### Risk Rating

High

### Validation Status

Candidate threat — requires local confirmation.

---

## T4 — Broken Object/Function Authorization

### STRIDE Category

Primary:

Elevation of Privilege

Secondary:

Information Disclosure / Tampering

### Asset

- User records
- Benefits/application records
- Privileged application functions

### Entry Point

Requests containing user/object identifiers or requests to restricted
functionality.

### Threat Scenario

An authenticated lower-privileged user manipulates an object
identifier or directly accesses restricted application functionality.

If the server does not perform appropriate authorization checks, the
attacker may access or modify information outside their allowed scope.

### Architecture Relationship

DF1:

Browser → NodeGoat

TB1:

User → Application boundary

### Likelihood

2 — Medium

### Impact

3 — High

### Risk Score

6

### Risk Rating

High

### Validation Status

Candidate threat — requires local confirmation.

---

# Risk Summary

| ID | Threat | Primary STRIDE | Likelihood | Impact | Score | Rating |
|---|---|---|---:|---:|---:|---|
| T1 | Account/session impersonation | Spoofing | 3 | 3 | 9 | Critical |
| T2 | Injection | Tampering | 3 | 3 | 9 | Critical |
| T3 | Stored XSS | Tampering | 3 | 2 | 6 | High |
| T4 | Broken authorization | Elevation of Privilege | 2 | 3 | 6 | High |
