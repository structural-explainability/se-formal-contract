/-!
File: SEFormalContract.Basic

Owns:

- shared primitives
- core names/types
- contract version type/value
- invariant identifiers
- theorem identifiers
- shared predicates used by other files

Does not own:

- regime semantics
- mapping relations
- domain examples
- export encoding details

Notes:

- This is the lowest-level module.
- All other modules may depend on this file.
- Keep minimal and stable. Avoid refactoring once referenced externally.
-/

namespace SEFormalContract

structure ContractVersion where
  major : Nat
  minor : Nat
  patch : Nat
deriving Repr, DecidableEq

def currentContractVersion : ContractVersion :=
  { major := 0, minor := 2, patch := 0 }

inductive InvariantId where
  | formalContractIsRoot
  | noCycles
  | noReverseFoundationDependencies
  | constitutionIsFoundational
deriving Repr, DecidableEq

inductive TheoremId where
  | ontologicalNeutrality
  | regimeNecessity
  | regimeSufficiency
deriving Repr, DecidableEq

inductive TheoremKind where
  | theorem
  | lemma
  | axiom
deriving Repr, DecidableEq

end SEFormalContract
