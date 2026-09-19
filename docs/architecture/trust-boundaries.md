# NodeGoat Trust Boundaries

## Owner

Member 1 — Project Leader

## TB1 — User to Application Boundary

### Between

Local browser

and

NodeGoat web application

### Data Flow

DF1

### Risk

The browser can supply attacker-controlled input.

Examples include:

- Form parameters
- Query parameters
- Object identifiers
- Login fields
- Profile fields
- Cookies
- Request headers

### Security Controls

Controls that may protect this boundary include:

- Input validation
- Authentication
- Session management
- Authorization
- Output encoding
- CSRF protection
- Audit logging

Some of these controls will be evaluated and improved in later
project phases.

---

## TB2 — Application to Database Boundary

### Between

NodeGoat web container

and

MongoDB container

### Data Flow

DF2

### Risk

Application-controlled input may influence database queries and
stored application data.

### Security Controls

Relevant controls include:

- Safe query construction
- Input type validation
- Authorization checks
- Least privilege
- Secure credentials
- Audit logging

These controls will be evaluated in later secure-coding and
secrets-management phases.

---

## Environmental Boundary

The complete environment operates inside the authorised local
Ubuntu development machine.

NodeGoat is intentionally vulnerable.

The current web-service host binding is:

127.0.0.1:4000

The MongoDB service is not intentionally published directly to the
host.

This project does not perform vulnerability testing against external
third-party infrastructure.

---

## Future Architecture

The following components are planned but are NOT yet represented as
implemented runtime components:

- GitHub Actions
- Semgrep
- Dependency scanning
- Gitleaks
- Trivy
- HashiCorp Vault
- Optional OWASP ZAP

They will be added to the architecture documentation only after their
implementation.
