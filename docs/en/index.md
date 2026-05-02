# SE Formal Contract

Lean 4–verified formal contract for Structural Explainability.

This repository defines the machine-checked structural constraints that authorize
the operational behavior of the SE ecosystem. It establishes the admissible
identity regimes, neutrality conditions, and relation primitives, and exports
these as contract artifacts for downstream repositories.

## What this is

A formal contract layer that:

- defines structural constraints independent of interpretation
- encodes identity-and-persistence regime profiles
- establishes neutrality conditions for admissible substrates
- defines allowed structural relation primitives
- exports invariant, regime, relation, and proof registries

The contract is authoritative. Downstream repositories consume these artifacts
and must conform to them.

## What this is not

This repository does not:

- define operational validation pipelines
- define repository governance or dependency rules
- contain domain mappings or datasets
- encode interpretation, causality, or normative meaning

Those responsibilities belong to other SE repositories.

## Structure

### Lean formal surface

```text
SEFormalContract/
  Basic.lean        core identifiers and shared types
  Regime.lean       identity regime profile definitions
  Neutrality.lean   neutrality constraints and assumptions
  Relation.lean     structural relation primitives
  Export.lean       contract-facing declarations
  ExportJson.lean   JSON export from Lean surface
```

### Exported contract artifacts

```text
data/contract/
  manifest.toml
  invariant-registry.json
  regime-registry.json
  relation-registry.json
  proof-registry.json
```

These artifacts are generated and must not be manually edited.

## Identity regime profiles

The contract defines nine identity-and-persistence regime profiles:

- OBL - obligation-bearing entity
- OCC - time-indexed occurrence
- REC - descriptive record
- ENR-L - locus-bound referent
- ENR-I - instrument-bound referent
- CTX-E - extension-based context
- CTX-S - structure-based context
- NOR-C - content-sensitive normative structure
- NOR-S - structure-sensitive normative structure

These arise from transformation-induced split pressure and define the minimal
admissible regime surface.

## Execution

Export contract artifacts from Lean:

```shell
lake exe export_contract
```

Validate exported artifacts:

```shell
uv run se-formal-contract validate
```

## Contract boundary

- Lean defines what is structurally admissible.
- Export produces machine-readable contract artifacts.
- Python validates artifact integrity.
- Downstream repositories enforce the contract.

No operational workflow depends on editing Lean.

## Versioning

Changes to:

- regime profiles
- relation primitives
- invariant identifiers

constitute contract surface changes and must be versioned accordingly.

## See also

- `docs/non-lean-explanation.md` - conceptual description of formal claims
- `docs/boundary.md` - formal vs operational separation
- `docs/migration/from-existing-formalizations.md` - migration record
