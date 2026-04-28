import SEFormalContract.Neutrality.Core
import SEFormalContract.Neutrality.Spec

/-!
File: SEFormalContract.Neutrality.Conformance

Owns:

- identifier-to-theorem trace surface for neutrality requirements

Does not own:

- new theory
- JSON export
-/

namespace SEFormalContract.Neutrality.Conformance

open SEFormalContract.Neutrality.Spec

structure ConformanceEvidence where
  neutrality_precausal :
    Req_FC_NEUTRALITY_PRECAUSAL ↔
      (∀ s : SEFormalContract.Substrate,
        SEFormalContract.OntologicallyNeutral s →
        SEFormalContract.PreCausal s)

  neutrality_prenormative :
    Req_FC_NEUTRALITY_PRENORMATIVE ↔
      (∀ s : SEFormalContract.Substrate,
        SEFormalContract.OntologicallyNeutral s →
        SEFormalContract.PreNormative s)

  neutrality_definition :
    Req_FC_NEUTRALITY_DEFINITION ↔
      (∀ s : SEFormalContract.Substrate,
        SEFormalContract.OntologicallyNeutral s ↔
          (SEFormalContract.PreCausal s ∧
           SEFormalContract.PreNormative s))

end SEFormalContract.Neutrality.Conformance
