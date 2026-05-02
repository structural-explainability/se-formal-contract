import SEFormalContract.Basic

/-
TheoremRegistry.lean

Curated theorem registry for the SE formal contract export.

This module does not define theorems. It records stable references to
Lean theorem declarations that are part of the exported contract surface.
-/

namespace SEFormalContract

/-- Status of a theorem reference in the exported contract. -/
inductive TheoremStatus where
  | checked
  | pending
  | retired
deriving Repr, BEq


/-- Stable reference to a theorem exposed through the formal contract. -/
structure TheoremRegistryEntry where
  id : String
  moduleName : String
  declarationName : String
  kind : TheoremKind
  status : TheoremStatus
  dependsOn : List String
deriving Repr, BEq

/-- Curated theorem references exported by the formal contract. -/
def theoremRegistry : List TheoremRegistryEntry := [
  {
    id := "neutrality_constraints"
    moduleName := "SEFormalContract.Neutrality"
    declarationName := "neutrality_constraints"
    kind := TheoremKind.theorem
    status := TheoremStatus.pending
    dependsOn := []
  },
  {
    id := "regime_profile_derivation"
    moduleName := "SEFormalContract.RegimeProfile"
    declarationName := "regime_profile_derivation"
    kind := TheoremKind.theorem
    status := TheoremStatus.pending
    dependsOn := ["neutrality_constraints"]
  },
  {
    id := "relation_primitives_closed"
    moduleName := "SEFormalContract.Relation"
    declarationName := "relation_primitives_closed"
    kind := TheoremKind.theorem
    status := TheoremStatus.pending
    dependsOn := []
  }
]

end SEFormalContract
