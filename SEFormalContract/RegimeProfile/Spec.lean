import SEFormalContract.RegimeProfile.Core

/-!
File: SEFormalContract.RegimeProfile.Spec

Owns:

- stable regime profile requirement identifiers
- regime profile requirement shapes

Does not own:

- regime profile definitions
- theorem proofs
- JSON export
- domain-specific examples
-/

namespace SEFormalContract.RegimeProfile.Spec

def FC_REGIMES_NINE_PROFILES : String :=
  "FC.REGIMES.NINE_PROFILES"

def FC_REGIMES_ALL_ADMISSIBLE : String :=
  "FC.REGIMES.ALL_ADMISSIBLE"

/-- REQ: FC.REGIMES.NINE_PROFILES -/
def Req_FC_REGIMES_NINE_PROFILES : Prop :=
  SEFormalContract.exportedRegimeProfileCount = 9

/-- REQ: FC.REGIMES.ALL_ADMISSIBLE -/
def Req_FC_REGIMES_ALL_ADMISSIBLE : Prop :=
  ∀ r : SEFormalContract.RegimeProfile, r.isAdmissible

end SEFormalContract.RegimeProfile.Spec
