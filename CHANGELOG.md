### Added Features

- Add info subcommand in order to query grype db vulnerabilities [[#1629](https://github.com/anchore/grype/issues/1629) [#2031](https://github.com/anchore/grype/pull/2031) @tomersein]

### Bug Fixes

- correctly close the db file in v4/v5 stores [[#2066](https://github.com/anchore/grype/pull/2066) @AndreiStefanie]
- Grype panics with a nil pointer dereference error when given an empty string argument [[#2063](https://github.com/anchore/grype/issues/2063) [#2064](https://github.com/anchore/grype/pull/2064) @lucasrod16]
- Ignoring search results when CPE is not set in the SBOM [[#2039](https://github.com/anchore/grype/issues/2039) [#2040](https://github.com/anchore/grype/pull/2040) @aeg]
- "No vulnerability database update available" when actually the check for an update was unsuccessful [[#310](https://github.com/anchore/grype/issues/310) [#1247](https://github.com/anchore/grype/pull/1247) @shanedell]
- CycloneDX output `metadata.properties` set to `null` instead of empty array or omitted [[#1759](https://github.com/anchore/grype/issues/1759)]

### Additional Changes

- update Syft to v1.11.1 [[#2071](https://github.com/anchore/grype/pull/2071) @anchore-actions-token-generator]
- add grype version to db network operations [[#2062](https://github.com/anchore/grype/pull/2062) @kzantow]

**[(Full Changelog)](https://github.com/anchore/grype/compare/v0.79.6...v0.80.0)**
