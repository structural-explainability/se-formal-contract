# Non-Formal Explanation

This document describes the formal contract of Structural Explainability without
reference to implementation or theorem-proving details.

It explains what the contract requires, why it exists, and what it constrains.

## Purpose

The formal contract defines the minimal structural conditions under which:

- identity can be evaluated
- persistence can be tracked over time
- systems can be compared
- disagreement can persist without breaking structure

These conditions are independent of interpretation.

## Core idea

A system is admissible if identity and persistence can be evaluated without
relying on meaning, role, or interpretation.

This requires:

- fixed identity conditions
- explicit structural relationships
- separation between structure and interpretation

## Identity and persistence

Structural Explainability does not assume a single notion of identity.

Instead, identity is evaluated under distinct **regime profiles**.

Each profile defines:

- what counts as “the same”
- what counts as “different”
- how transformations affect identity

## Regime profiles

The contract requires nine identity-and-persistence regime profiles:

### Unsplit profiles

- **OBL** — obligation-bearing entity
- **OCC** — time-indexed occurrence
- **REC** — descriptive record

These do not require refinement under admissible transformations.

### ENR refinement (branching)

- **ENR-L** — locus-bound referent
- **ENR-I** — instrument-bound referent

Two representations can refer to the same locus even when artifacts differ,
but cannot remain the same artifact once branching produces distinct objects.

### CTX refinement (decomposition)

- **CTX-E** — extension-based context
- **CTX-S** — structure-based context

Two representations can apply to the same cases even when internally structured
differently, but cannot be the same structure once decomposition changes that organization.

### NOR refinement (structural vs content)

- **NOR-C** — content-sensitive normative structure
- **NOR-S** — structure-sensitive normative structure

Two representations can encode the same normative content while differing in structure,
but cannot remain the same structure once that organization changes.

## Why refinement is required

A single regime is insufficient when a transformation must be:

- identity-preserving under one basis, and
- identity-breaking under another

This creates **split pressure**.

The ENR, CTX, and NOR refinements are forced by this condition.

The result is a lower bound of nine regime profiles.

## Relations

Relations connect entities but do not determine identity.

They describe structure, not meaning.

Allowed relation primitives include:

- equivalent
- narrower
- broader
- overlaps
- none

These relations do not alter identity conditions.

## Neutrality

The contract requires structural neutrality.

This means:

- identity is not derived from interpretation
- causal or normative meaning is not embedded in structure
- multiple incompatible interpretations may exist over the same structure

Interpretation is external to the substrate.

## Consequences

### Comparison

Two systems are comparable if their structures can be aligned under the same
regime profiles and relations.

Interpretation differences do not affect comparability.

### Persistence of disagreement

Disagreement does not break structure.

Different interpretations can coexist over the same structural representation.

### Transformation

Changes to a system are evaluated structurally:

- whether identity is preserved
- whether admissibility is maintained
- how regime classifications are affected

## Boundary

The formal contract defines:

- what is structurally admissible

It does not define:

- what things mean
- what is true or false
- what should be done

Those belong to interpretive or domain-specific layers.
