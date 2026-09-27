# npm audit Before/After Comparison

| Severity | Before | After |
| --- | --- | --- |
| Critical | 38 | 38 |
| High | 66 | 66 |
| Moderate | 33 | 33 |
| Low | 8 | 8 |

## Notes

The NodeGoat base image intentionally uses old dependencies. Some findings will remain because the application must stay runnable. The SCA gate in CI/CD will be configured to fail only on critical/high findings above an agreed threshold.
