import SEFormalContract.Export.Invariants
import SEFormalContract.Export.Regimes
import SEFormalContract.Export.Relations
import SEFormalContract.Export.Proofs
import SEFormalContract.Export.Theorems

/-!
File: SEFormalContract.Export.Spec

Owns:
  - structural facts about exported lists
  - count theorems
  - nodup theorems

Does not own:
  - list definitions (those live in per-concern modules)
  - conformance predicates
-/

namespace SEFormalContract

theorem exportedRegimes_card :
    exportedRegimes.length = 9 := by native_decide

theorem exportedRelations_card :
    exportedRelations.length = 5 := by native_decide

theorem exportedInvariants_card :
    exportedInvariants.length = 4 := by native_decide

theorem exportedProofs_card :
    exportedProofs.length = 3 := by native_decide

theorem exportedTheorems_card :
    exportedTheorems.length = 3 := by native_decide

theorem exportedRegimes_nodup :
    exportedRegimes.Nodup := by native_decide

theorem exportedRelations_nodup :
    exportedRelations.Nodup := by native_decide

theorem exportedInvariants_nodup :
    exportedInvariants.Nodup := by native_decide

-- Every TheoremId appears exactly once in exportedProofs.
-- Lean certifies structure only; not empirical proof status.
-- Status values in exportedProofs are hand-maintained; see Export/Proofs.lean.
theorem exportedProofs_complete (t : TheoremId) :
    ∃ r ∈ exportedProofs, r.theoremId = t := by
  cases t <;> native_decide

theorem exportedProofs_nodup_theoremIds :
    (exportedProofs.map (·.theoremId)).Nodup := by
  native_decide

end SEFormalContract
