import SEFormalContract.Basic

/-!
File: SEFormalContract.Export.Invariants

Owns:
  - exportedInvariants list
-/

namespace SEFormalContract

def exportedInvariants : List InvariantId :=
  [
    InvariantId.formalContractIsRoot,
    InvariantId.noCycles,
    InvariantId.noReverseFoundationDependencies,
    InvariantId.constitutionIsFoundational
  ]

end SEFormalContract
