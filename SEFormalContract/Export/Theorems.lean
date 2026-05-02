import SEFormalContract.Export.Core

/-!
File: SEFormalContract.Export.Theorems

Owns:
  - exportedTheorems list
  - theorem registry surface consumed by theorem-registry.json

Notes:
  - moduleName and declarationName must match upstream Lean source.
  - dependsOn reflects logical dependency, not import order.
-/

namespace SEFormalContract

def exportedTheorems : List TheoremRecord :=
  [
    {
      id              := TheoremId.ontologicalNeutrality
      moduleName      := "SEFormalContract.Neutrality"
      declarationName := "ontologicalNeutrality"
      kind            := TheoremKind.theorem
      dependsOn       := []
    },
    {
      id              := TheoremId.regimeNecessity
      moduleName      := "SEFormalContract.Requirement"
      declarationName := "regimeNecessity"
      kind            := TheoremKind.theorem
      dependsOn       := [TheoremId.ontologicalNeutrality]
    },
    {
      id              := TheoremId.regimeSufficiency
      moduleName      := "SEFormalContract.Requirement"
      declarationName := "regimeSufficiency"
      kind            := TheoremKind.theorem
      dependsOn       := [TheoremId.ontologicalNeutrality]
    }
  ]

end SEFormalContract
