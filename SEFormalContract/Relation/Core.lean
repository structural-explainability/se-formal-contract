import SEFormalContract.Basic

/-!
File: SEFormalContract.Relation.Core

Owns:

- allowed structural relation primitives
- relation admissibility predicate
- relation-level theorem statements/proofs

Does not own:

- requirement identifiers
- conformance trace records
- JSON export
- mapping data or interpretation semantics
-/

namespace SEFormalContract

inductive Relation where
  | equivalent
  | narrower
  | broader
  | overlaps
  | none
deriving Repr, DecidableEq

def Relation.isAdmissible (_r : Relation) : Prop :=
  True

theorem allRelationsAdmissible (r : Relation) : r.isAdmissible := by
  trivial

end SEFormalContract
