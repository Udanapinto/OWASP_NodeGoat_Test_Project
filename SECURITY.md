# Security Policy

## Project Purpose

This repository is part of the IE3142 DevOps Security university
assignment.

OWASP NodeGoat is intentionally vulnerable software used for
controlled educational security testing.

## Supported Environment

Testing is performed only against authorised local Docker-based
instances of this repository.

## Security Testing Boundary

Permitted:

- Local vulnerability testing
- Threat modelling
- SAST
- Dependency scanning
- Secret scanning
- Container image scanning
- Controlled Burp Suite testing
- Optional local DAST testing

Not permitted within this project:

- Testing third-party websites
- Testing external APIs
- Testing public infrastructure
- Accessing real user accounts
- Using real confidential data

## Secrets

Do not commit:

- Passwords
- API keys
- Access tokens
- Private keys
- Real database credentials

Use environment variables and approved secret-management mechanisms.

## Vulnerability Baseline

The Git tag:

```text
vulnerable-baseline
