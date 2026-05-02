# Migration from Existing Formalizations

## Status

Migration to `se-formal-contract` is complete for the initial release.

This document records which prior formalizations contributed to the
current contract surface.

Material was selectively adapted to produce a minimal, stable formal contract.

## Sources retained

The following prior formalizations informed the current contract:

| Repository                 | Contribution                                         |
| -------------------------- | ---------------------------------------------------- |
| `NeutralSubstrate`         | neutrality concepts and theorem structure            |
| `IdentityRegimes`          | requirement structure and regime derivation patterns |
| `StructuralExplainability` | cross-cutting definitions and naming                 |

These were treated as **conceptual sources**, not as structures to preserve.

## What was produced

The current formal contract exposes:

- structural requirements (R1–R6)
- regime profiles (9 profiles)
- structural relations
- invariant identifiers
- proof status registry

These are exported for operational validation via JSON artifacts.

## Out of scope

The following were intentionally not included in this contract:

- `AccountableEntities`
- `EvolutionProtocol`
- `CEE`
- `GovernanceBoundary`
- `InterpretationBoundary`

If formalized, they belong in separate contracts or downstream layers.

## Design decision

This repository defines the **formal contract surface only**.

It does not preserve:

- prior repository structure
- full theorem sets
- migration trace logs

Only the minimal structures required to support downstream validation
are included.
