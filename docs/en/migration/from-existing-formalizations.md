# Migration from Existing Formalizations

This document records how prior Lean 4 formalization repositories are reviewed,
classified, and selectively migrated into `se-formal-contract`.

The goal is not to preserve repository structure. The goal is to preserve the
formal definitions, theorem statements, proof patterns, and conceptual boundaries
that remain part of the current Structural Explainability formal contract.

## Migration principle

Existing formalization repositories are treated as prior formal sources.

They do not define the current architecture by default. Material is migrated only
when it supports the formal contract exported to operational SE repositories.

## Target repository

Current target:

```text
se-formal-contract
```

The target repository owns:

- Lean 4 definitions for formal SE constraints
- machine-checked theorem status
- exported contract artifacts
- proof-to-contract traceability

It does not own:

- operational validators
- domain mappings
- applied datasets
- regime execution pipelines
- interpretation-specific semantics

## Source repositories

| Repository                 | Prior purpose                                                       | Initial status      | Migration disposition                                                                                       |
| -------------------------- | ------------------------------------------------------------------- | ------------------- | ----------------------------------------------------------------------------------------------------------- |
| `StructuralExplainability` | Cross-cutting constraints; neutrality and conformance predicates    | Prior formal source | Review for reusable top-level definitions and theorem statements                                            |
| `NeutralSubstrate`         | Neutrality theorem; substrates stable under incompatible extensions | Prior formal source | Review for neutrality definitions and theorem structure                                                     |
| `IdentityRegimes`          | Six identity-and-persistence regimes                                | Prior formal source | Review for regime definitions, necessity/sufficiency claims, and proof structure                            |
| `AccountableEntities`      | Entity-regime instantiation                                         | Prior formal source | Review for AE-specific instantiation patterns; do not migrate domain-specific naming unless still canonical |
| `EvolutionProtocol`        | Neutral exchange substrate and graph evolution                      | Prior formal source | Review for evolution primitives and graph-transition constraints                                            |
| `CEE`                      | Explanation overlay and contextual evidence structures              | Prior formal source | Review only for interface-boundary constraints; avoid importing interpretation semantics                    |
| `GovernanceBoundary`       | Governance boundary                                                 | Prior formal source | Review for boundary constraints; avoid importing governance-specific semantics into the formal contract     |
| `InterpretationBoundary`   | Conditions for external interpretation of substrate records         | Prior formal source | Review for boundary constraints that prevent interpretation leakage                                         |

## Review checklist

For each source repository, record:

- Lean version and build status
- theorem statements worth preserving
- definitions worth preserving
- proof patterns worth preserving
- names that should remain canonical
- names that should be retired
- assumptions that must be made explicit
- material that belongs outside `se-formal-contract`

## Migration categories

Each item reviewed should be classified as one of:

| Category  | Meaning                                                           |
| --------- | ----------------------------------------------------------------- |
| `migrate` | Move into `se-formal-contract` with current naming                |
| `adapt`   | Preserve the idea, but revise naming, structure, or assumptions   |
| `archive` | Preserve historically, but do not include in the current contract |
| `reject`  | Do not preserve because it conflicts with current architecture    |

## Migration record template

Use this format for each reviewed item.

````markdown
### Source item

Repository:
Path:
Item name:
Item kind: definition | theorem | lemma | structure | example | proof pattern

### Current status

Builds in current Lean toolchain: yes | no | unknown
Depends on obsolete names: yes | no | unknown
Contains domain semantics: yes | no | unknown

### Decision

Migration category: migrate | adapt | archive | reject

### Rationale

Explain why this item should or should not enter the formal contract.

### Target location

Planned target path in `se-formal-contract`:

```text
FormalContract/...
```
````

### Contract impact

Exported artifact affected:

- invariant registry
- regime registry
- relation registry
- proof registry
- none

### Notes

Additional comments.

```

## Initial migration order

Review in this order:

1. `NeutralSubstrate`
2. `IdentityRegimes`
3. `StructuralExplainability`
4. `AccountableEntities`
5. `EvolutionProtocol`
6. `InterpretationBoundary`
7. `GovernanceBoundary`
8. `CEE`

Rationale:

- neutrality and regime structure define the formal core
- AE and EP are substrate applications
- boundary repositories should constrain leakage, not define the core
- CEE should remain interface-level unless a constraint is genuinely structural

## Non-migration rules

Do not migrate material that:

- makes domain-specific semantic claims
- requires operational contributors to understand Lean
- collapses interpretation into the neutral substrate
- duplicates validator behavior better handled in Python
- weakens the formal/operational boundary

## Completion criterion

This migration is complete when `se-formal-contract` contains a minimal checked
formal contract that can export:

- contract manifest
- invariant registry
- regime registry
- relation registry
- proof registry

The first release does not need to preserve every prior theorem. It needs to
establish the formal contract boundary cleanly.
```
