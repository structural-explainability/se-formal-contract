# Changelog

<!-- markdownlint-disable MD024 -->

All notable changes to this project will be documented in this file.

The format is based on **[Keep a Changelog](https://keepachangelog.com/en/1.1.0/)**
and this project adheres to **[Semantic Versioning](https://semver.org/spec/v2.0.0.html)**.

## [Unreleased]

---

## [0.2.0] - 2026-05-02

### Added

.github workflow to fetch theory repo reference contents.

Formal contract manifest and export alignment:

- Added `[contract]` section to declare contract version and authority
- Added `[exports]` section with canonical machine-readable artifact paths
- Established explicit contract production role (`exports_verified_contract = true`)
- Defined contract as the root of the formal dependency chain

Contract-consumption readiness:

- Enables `se-constitution` to consume contract via `consumes_contract_from`
- Enables downstream validation against exported contract artifacts

### Changed

- Clarified separation between logical artifacts (`[provides]`) and physical artifact paths (`[exports]`)
- Strengthened contract authority model for downstream repositories

### Removed

- app.py

### Notes

- This release establishes the contract-consumption boundary between `se-formal-contract` and `se-constitution`
- No breaking changes to existing contract artifacts

---

## [0.1.0] - 2026-04-27

### Added

Initial Lean 4 formal contract structure (`SEFormalContract`)

- Core modules: `Basic`, `Regime`, `Neutrality`,
  `Relation`, `Export`, `ExportJson`
- Public library root with stable import surface

Canonical identity regime profile definitions:

- OBL, OCC, REC, ENR-L, ENR-I, CTX-E, CTX-S, NOR-C, NOR-S

Structural relation primitives:

- equivalent, narrower, broader, overlaps, none

Lean-based contract export layer:

- JSON export via `ExportJson`
- invariant registry
- regime registry
- relation registry
- proof registry

Python validation and CLI interface:

- validation module (`se_formal_contract.app`)
- CLI interface (`se_formal_contract.cli`, `__main__`)

Generated contract artifacts under `data/contract/`

SE manifest (`SE_MANIFEST.toml`) defining repository role as formal contract root

Migration scaffolding:

- `docs/migration/from-existing-formalizations.md`

Repository governance and tooling:

- `AGENTS.md`
- `CITATION.cff`

### Notes

- Establishes `se-formal-contract` as the authoritative root of the formal contract chain.
- Downstream repositories must consume this contract via `se-constitution`.
- Lean definitions are the authoritative source of contract structure.
- Exported artifacts are generated and must not be manually edited.
- Proof surface is partial; theorem status is explicitly recorded in `data/contract/proof-registry.json`.
- Entries may be marked as pending, and downstream consumers must treat proof status
  as authoritative from the registry.

---

## Notes on versioning and releases

- We use **SemVer**:
  - **MAJOR** – breaking changes to artifact structure or validation semantics
  - **MINOR** – backward-compatible additions to schema or validation rules
  - **PATCH** – fixes, documentation, tooling
- Versions are driven by git tags. Tag `vX.Y.Z` to release.
- Docs are deployed per version tag and aliased to **latest**.
- `contract_version`, `CITATION.cff version`, and git tag **must always match**

## Release Procedure (Required)

Follow these steps exactly when creating a new release.

### Task 1. Update release metadata (manual edits)

1.1. lakefile.toml: update version
1.2. CHANGELOG.md: add section, move unreleased entries, update links
1.3. `SEFormalContract/Basic.lean` update
  `currentContractVersion` to `{ major := X, minor := Y, patch := Z }`

### Task 2. Regenerate exported contract artifacts

2.1. Regenerate JSON contract artifacts from Lean.
2.2. Sync `SE_MANIFEST.toml` and `CITATION.cff` from generated JSON.

This reads `data/contract/invariant-registry.json`
for the canonical version and updates:

- `SE_MANIFEST.toml` `[contract].contract_version` and `[exports]` paths
- `CITATION.cff` `version` and `date-released` (today's date)

```shell
lake exe export_contract
uv run se-formal-contract sync
```

### Task 3. Validate locally (pre-tag)

```shell
uv sync --extra dev --extra docs --upgrade
git add -A
uvx pre-commit run --all-files
uv run se-formal-contract validate
uv run python -m pyright
uv run python -m pytest
uv run python -m zensical build
```

### Task 4. Commit, tag, push

```shell
git add -A
git commit -m "Prep X.Y.Z"
git push -u origin main
```

Verify actions run on GitHub. After success:

```shell
git tag vX.Y.Z -m "X.Y.Z"
git push origin vX.Y.Z
```

### Task 5. After tagging, verify tag consistency

```shell
uv run se-formal-contract validate --require-tag
```

## Links

[Unreleased]: https://github.com/structural-explainability/se-formal-contract/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/structural-explainability/se-formal-contract/releases/tag/v0.2.0
[0.1.0]: https://github.com/structural-explainability/se-formal-contract/releases/tag/v0.1.0
