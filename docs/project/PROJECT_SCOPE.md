# IE3142 DevOps Security Project Scope

## Project Title

Building and Securing a DevSecOps Pipeline using OWASP NodeGoat

## Course

IE3142 - DevOps Security

## Application

OWASP NodeGoat

## Application Architecture

The selected application consists primarily of:

1. NodeGoat web application
   - Node.js
   - Express.js

2. MongoDB database

The two components communicate with each other and will eventually
be executed using Docker containers and Docker Compose.

## Development Environment

Primary development environment:

- Ubuntu Linux
- Visual Studio Code
- Git
- GitHub
- Docker
- Docker Compose

## Security Assessment Scope

The project will perform controlled security testing only against
the locally hosted copy of OWASP NodeGoat.

The project will contain:

- Architecture analysis
- STRIDE threat modelling
- Risk assessment
- Four demonstrated vulnerabilities
- Secure coding remediation
- Re-testing after remediation
- Persistent security/audit logging
- Static Application Security Testing
- Dependency scanning
- Secrets scanning
- Container image scanning

## Planned Security Tools

### Manual / Dynamic Testing

- Burp Suite

### SAST

- Semgrep

### Dependency / SCA

- npm audit

### Secret Detection

- Gitleaks

### Container Image Scanning

- Trivy

### Optional DAST

- OWASP ZAP

## CI/CD Platform

GitHub Actions

The final CI/CD pipeline will contain:

1. Application build/test
2. Semgrep SAST
3. npm dependency analysis
4. Gitleaks secrets scanning
5. Docker image build
6. Trivy container scanning
7. Security gates capable of blocking unsafe builds

OWASP ZAP may be added as an optional DAST stage.

## Secrets Management

Minimum:

- GitHub Actions encrypted secrets

Enhanced implementation:

- HashiCorp Vault
- Runtime secret injection

No real credentials will be hardcoded into source code.

## Threat Modelling Scope

Four strong application-specific STRIDE threats will be documented.

Each threat must include:

- Asset affected
- STRIDE classification
- Attack scenario
- Likelihood
- Impact
- Risk level
- Mitigation
- Location of the mitigating control

## Vulnerability Scope

Exactly four vulnerabilities will be selected for detailed
exploit-and-fix demonstrations.

Each vulnerability must have:

1. Vulnerable behaviour
2. Vulnerable code
3. Controlled exploit
4. Burp Suite request/response evidence where applicable
5. Security impact
6. Secure coding fix
7. Re-test using the same attack
8. Evidence showing attack failure after remediation
9. Before/after SAST evidence where applicable

## Evidence Strategy

Evidence will be collected while implementing the project.

Evidence folders will contain:

- Docker evidence
- Architecture diagrams
- Threat model
- Burp Suite requests/responses
- Vulnerable code evidence
- Secure coding evidence
- SAST before/after results
- Pipeline screenshots
- Failed security-gate demonstration
- Secrets-management evidence
- Vault evidence
- Optional ZAP evidence

## Project Boundaries

All vulnerability demonstrations and security scans will be
performed only against systems the group is explicitly authorised
to test.

No testing will be performed against:

- Public NodeGoat deployments
- Third-party websites
- Third-party APIs
- External servers
- External networks
- Real user accounts

## Final Deliverables

- Source-code repository
- Docker configuration
- CI/CD pipeline
- Architecture diagram
- STRIDE threat model
- Risk assessment
- Four exploit-and-fix demonstrations
- Security scan evidence
- Secrets-management implementation
- Technical report
- Ethical Clearance Form
- Individual Contribution Statement
- Viva preparation