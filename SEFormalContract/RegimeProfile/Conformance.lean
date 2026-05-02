import SEFormalContract.RegimeProfile.Core
import SEFormalContract.RegimeProfile.Spec

/-!
File: SEFormalContract.RegimeProfile.Conformance

Owns:

- identifier-to-theorem trace surface for regime requirements

Does not own:

- new regime profiles
- new theory
- JSON export
- domain-specific examples
-/

namespace SEFormalContract.RegimeProfile.Conformance

open SEFormalContract.RegimeProfile.Spec

structure ConformanceEvidence where
  regimes_nine_profiles :
    Req_FC_REGIMES_NINE_PROFILES ↔
      SEFormalContract.exportedRegimeProfileCount = 9

  regimes_all_admissible :
    Req_FC_REGIMES_ALL_ADMISSIBLE ↔
      (∀ r : SEFormalContract.RegimeProfile, r.isAdmissible)

end SEFormalContract.RegimeProfile.Conformance
