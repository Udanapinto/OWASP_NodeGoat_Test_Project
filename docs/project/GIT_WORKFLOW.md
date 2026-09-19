# Git Workflow

## Permanent Branches

### main

Stable project branch.

Only reviewed and validated work should eventually enter main.

### develop

Integration branch.

Member feature/fix branches are merged into develop through Pull
Requests.

---

## Member Branches

Member 1:

- member1/project-foundation
- member1/docker
- member1/architecture
- member1/sast
- member1/vuln-01

Member 2:

- member2/threat-model
- member2/risk-assessment
- member2/sca
- member2/vuln-02

Member 3:

- member3/secure-coding
- member3/audit-logging
- member3/secrets
- member3/gitleaks
- member3/vuln-03

Member 4:

- member4/cicd
- member4/trivy
- member4/pipeline-gates
- member4/vuln-04

---

## Vulnerable Baseline

The Git tag:

vulnerable-baseline

represents the original NodeGoat source before assignment-specific
security remediation.

The baseline must not be deleted or moved.

---

## Development Process

1. Update local develop branch.
2. Create a member-specific branch.
3. Make one logical change.
4. Test locally.
5. Commit using a meaningful message.
6. Push branch.
7. Open Pull Request against develop.
8. Review the Pull Request.
9. Merge into develop.
10. Delete completed feature branch if appropriate.

---

## Example

Member 2 starts threat modelling:

git switch develop
git pull origin develop
git switch -c member2/threat-model

After work:

git add .
git commit -m "docs(threat-model): add initial STRIDE assessment"
git push -u origin member2/threat-model

Then create a Pull Request:

member2/threat-model -> develop

---

## Commit Message Convention

Recommended pattern:

type(scope): description

Examples:

chore(docker): add baseline compose environment

docs(architecture): document NodeGoat data flow

feat(logging): add persistent security audit events

fix(vuln-01): enforce object-level authorization

security(sast): add Semgrep configuration

ci(trivy): enforce high severity image gate

---

## Important Rules

- Do not make vulnerability fixes directly on main.
- Do not delete vulnerable-baseline.
- Do not commit real secrets.
- Do not rewrite shared Git history without group approval.
- Do not use another member's Git identity.
- Every member must make meaningful project contributions.
- Security fixes must preserve before/after evidence.
