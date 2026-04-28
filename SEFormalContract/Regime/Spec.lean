import SEFormalContract.Regime.Core

/-!
File: SEFormalContract.Regime.Spec

Owns:

- stable regime requirement identifiers
- regime requirement shapes

Does not own:

- regime profile definitions
- theorem proofs
- JSON export
- domain-specific examples
-/

namespace SEFormalContract.Regime.Spec

def FC_REGIMES_NINE_PROFILES : String :=
  "FC.REGIMES.NINE_PROFILES"

def FC_REGIMES_ALL_ADMISSIBLE : String :=
  "FC.REGIMES.ALL_ADMISSIBLE"

/-- REQ: FC.REGIMES.NINE_PROFILES -/
def Req_FC_REGIMES_NINE_PROFILES : Prop :=
  SEFormalContract.exportedRegimeProfileCount = 9

/-- REQ: FC.REGIMES.ALL_ADMISSIBLE -/
def Req_FC_REGIMES_ALL_ADMISSIBLE : Prop :=
  ∀ r : SEFormalContract.Regime, r.isAdmissible

end SEFormalContract.Regime.Spec
