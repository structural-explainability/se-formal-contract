# SE Formal Contract

[![Docs Site](https://img.shields.io/badge/docs-site-blue?logo=github)](https://structural-explainability.github.io/se-formal-contract/)
[![Repo](https://img.shields.io/badge/repo-GitHub-black?logo=github)](https://github.com/structural-explainability/se-formal-contract)
[![Python 3.15+](https://img.shields.io/badge/python-3.15%2B-blue?logo=python)](./pyproject.toml)
[![License](https://img.shields.io/badge/license-MIT-yellow.svg)](./LICENSE)

[![CI-Lean](https://github.com/structural-explainability/se-formal-contract/actions/workflows/ci-lean.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-formal-contract/actions/workflows/ci-lean.yml)
[![CI](https://github.com/structural-explainability/se-formal-contract/actions/workflows/ci-python-zensical.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-formal-contract/actions/workflows/ci-python-zensical.yml)
[![Docs](https://github.com/structural-explainability/se-formal-contract/actions/workflows/deploy-zensical.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-formal-contract/actions/workflows/deploy-zensical.yml)
[![Links](https://github.com/structural-explainability/se-formal-contract/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/structural-explainability/se-formal-contract/actions/workflows/links.yml)

> Lean 4 formal contract layer for Structural Explainability.

This repository contains the machine-checked formal substrate that authorizes
the operational contracts consumed by SE constitution, kernel, mapspec, and
regime repositories.

It separates formal proof obligations from operational contribution workflows.
Contributors to operational SE repositories consume exported contract artifacts;
they do not need to edit Lean files or discharge proof obligations.

## Owns

- Lean 4 definitions for core SE formal constraints
- Machine-checked theorem status for selected invariants
- Exported contract artifacts used by operational repositories
- Versioned proof-to-contract traceability

## Does not own

- Operational validators
- Domain mappings
- Applied datasets
- Regime execution pipelines
- Interpretation-specific semantics

## Boundaries

SEFormalContract/

- Basic.lean foundational types and shared predicates only
- Regime.lean identity regime declarations and regime-level constraints
- Neutrality.lean neutrality assumptions, claims, and theorem stubs/results
- Relation.lean allowed relation primitives for operational mappings
- Export.lean contract-facing declarations intended to be exported

## Build and Run

```shell
elan self update
lake update
lake build
lake exe export_contract
```

## Command Reference

<details>
<summary>Show command reference</summary>

### In a machine terminal

After you get a copy of this repo in your own GitHub account,
open a machine terminal in `Repos` or where you want the project:

```shell
# Replace username with YOUR GitHub username.
git clone https://github.com/username/se-formal-contract

cd se-formal-contract
code .
```

### In a VS Code terminal

```shell
uv self update
uv python pin 3.15
uv sync --extra dev --extra docs --upgrade

uvx pre-commit install

git add -A
uvx pre-commit run --all-files
# repeat if changes were made
git add -A
uvx pre-commit run --all-files

# Run formal contract validation against
# exported artifacts (fail if contract is inconsistent)
uv run python -m se_formal_contract validate

# do chores
npx markdownlint-cli "**/*.md" --fix
uv run python -m ruff format .
uv run python -m ruff check . --fix
uv run python -m pyright
uv run python -m pytest
uv run python -m zensical build

# save progress
git add -A
git commit -m "update"
git push -u origin main
```

</details>

## Citation

[CITATION.cff](./CITATION.cff)

## License

[MIT](./LICENSE)

## Manifest

[SE_MANIFEST.toml](./SE_MANIFEST.toml)
