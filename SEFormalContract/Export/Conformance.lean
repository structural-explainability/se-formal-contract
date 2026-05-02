import SEFormalContract.Export.Spec

/-!
File: SEFormalContract.Export.Conformance

Owns:
  - conformance predicates over exported lists
  - admissibility of export surface

Does not own:
  - list definitions
  - structural count theorems (those live in Spec)
-/

namespace SEFormalContract

/-- Every exported regime is admissible. -/
theorem exportedRegimes_admissible :
    ∀ r ∈ exportedRegimes, r.isAdmissible := by
  intro r _
  exact allRegimeProfilesAdmissible r

/-- The export surface is non-empty. -/
theorem exportedRegimes_nonempty :
    exportedRegimes ≠ [] := by native_decide

theorem exportedProofs_nonempty :
    exportedProofs ≠ [] := by native_decide

theorem exportedTheorems_nonempty :
    exportedTheorems ≠ [] := by native_decide

end SEFormalContract
