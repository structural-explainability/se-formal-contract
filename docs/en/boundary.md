# Formal / Operational Boundary

This repository defines the **formal contract layer** of Structural Explainability.

The boundary between formal and operational layers is strict and enforced.

## Layer separation

### Formal layer (this repository)

- Defines:
  - identity regime profiles
  - neutrality constraints
  - structural relation primitives
  - invariant identifiers
- Produces:
  - machine-checked contract surface
  - exported contract artifacts (`data/contract/*`)

### Operational layer (downstream repositories)

- Implemented in Python / TOML / CLI
- Consumes:
  - invariant registry
  - regime registry
  - relation registry
  - proof registry
- Performs:
  - validation
  - mapping
  - execution
  - integration with external systems

## Dependency rule

```text
Formal layer → exports contract → operational layer consumes
```

- The formal layer has **no upstream dependencies**.
- Operational repositories must not redefine or extend formal constraints.
- All admissibility conditions originate in the formal contract.

## Source of truth

- Lean definitions are authoritative.
- JSON contract artifacts are generated outputs.
- Python code must not redefine:
  - regimes
  - relations
  - invariants

Any divergence between Lean and exported artifacts invalidates the contract.

## Generated artifacts

```text
data/contract/
```

- Must be produced via:

```shell
lake exe export_contract
```

- Must not be edited manually.
- Are versioned and consumed by downstream repositories.

## Allowed changes

### Formal layer

- Modify Lean definitions
- Add or refine regime profiles
- Update invariants or relations
- Change proof status

Requires:

- recompilation
- regeneration of contract artifacts
- version update

### Operational layer

- Add mappings
- extend validation
- build domain applications

Must not:

- alter contract structure
- introduce new regimes or relations

## Failure modes

### Contract drift

Occurs when:

- JSON artifacts are edited manually
- Python definitions diverge from Lean
- export is not rerun after Lean changes

Result:

- downstream validation becomes unreliable

### Boundary leakage

Occurs when:

- operational repositories redefine constraints
- interpretation is embedded in formal definitions
- mapping semantics alter identity conditions

Result:

- neutrality is violated
- cross-system comparability breaks

## Design constraint

All structural constraints must be:

- explicit
- minimal
- independent of interpretation

The formal contract defines admissibility.
The operational layer applies it.
