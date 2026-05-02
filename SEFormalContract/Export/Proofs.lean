import SEFormalContract.Export.Core

/-!
File: SEFormalContract.Export.Proofs

Owns:
  - exportedProofs list
  - proof status surface consumed by proof-registry.json

Notes:
  - Status values are hand-maintained.
  - They reflect confirmed upstream proof status and must be updated
    by a human after verifying the relevant theory repo.
  - Lean certifies structure only (see Export/Spec.lean) - not empirical proof status.
  - Do not automate status updates from external sources.-/

namespace SEFormalContract

def exportedProofs : List ProofRecord :=
  [
    { theoremId := TheoremId.ontologicalNeutrality, status := ProofStatus.pending },
    { theoremId := TheoremId.regimeNecessity,       status := ProofStatus.pending },
    { theoremId := TheoremId.regimeSufficiency,     status := ProofStatus.pending }
  ]

end SEFormalContract
