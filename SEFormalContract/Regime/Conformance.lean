import SEFormalContract.Regime.Core
import SEFormalContract.Regime.Spec

/-!
File: SEFormalContract.Regime.Conformance

Owns:

- identifier-to-theorem trace surface for regime requirements

Does not own:

- new regime profiles
- new theory
- JSON export
- domain-specific examples
-/

namespace SEFormalContract.Regime.Conformance

open SEFormalContract.Regime.Spec

structure ConformanceEvidence where
  regimes_nine_profiles :
    Req_FC_REGIMES_NINE_PROFILES ↔
      SEFormalContract.exportedRegimeProfileCount = 9

  regimes_all_admissible :
    Req_FC_REGIMES_ALL_ADMISSIBLE ↔
      (∀ r : SEFormalContract.Regime, r.isAdmissible)

end SEFormalContract.Regime.Conformance
