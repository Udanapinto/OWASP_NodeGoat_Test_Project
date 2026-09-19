# Development Rules

## Rule 1 - Never Work Directly on Main

Feature and vulnerability-remediation work must use branches.

Examples:

- feature/docker
- feature/cicd
- feature/vault
- fix/vuln-01
- fix/vuln-02

## Rule 2 - Never Commit Real Secrets

Never commit:

- Passwords
- API keys
- Access tokens
- Private keys
- Connection strings containing real credentials

## Rule 3 - Keep the Vulnerable Baseline

The original vulnerable NodeGoat version must be preserved so that
before/after security evidence can be reproduced.

## Rule 4 - Capture Evidence Before Changes

Before fixing a vulnerability:

1. Demonstrate it.
2. Capture the request.
3. Capture the response.
4. Capture relevant vulnerable code.
5. Capture baseline security scan results.

Only then implement the fix.

## Rule 5 - One Vulnerability per Branch

Use:

- fix/vuln-01
- fix/vuln-02
- fix/vuln-03
- fix/vuln-04

## Rule 6 - Meaningful Commits

Use descriptive commits such as:

fix(auth): enforce authorization before accessing user records

Rather than:

update

or:

final

## Rule 7 - All Members Must Contribute

Each team member should:

- Use their own Git identity
- Create meaningful commits
- Understand the changes they contribute

## Rule 8 - Local Testing Only

Security testing is limited to the authorised university laboratory
project environment.
