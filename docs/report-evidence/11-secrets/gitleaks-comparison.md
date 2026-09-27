# Gitleaks Before/After Comparison

| Metric | Before | After |
| --- | --- | --- |
| Total findings | 28 | 0 |
| Hardcoded secrets | 28 | 0 |

## Resolved Findings

| File | Rule | Before | After |
| --- | --- | --- | --- |
| app/server.js | generic-api-key | keyboard cat | Removed (env var) |
| app/config/config.js | mongodb-uri | hardcoded URI | Removed (env var) |
| app/app/data/user-dao.js | password | test password | Removed (env var) |
