import SEFormalContract.Requirement.Core
import SEFormalContract.Requirement.Spec

/-!
File: SEFormalContract.Requirement.Conformance

Owns:

- identifier-to-theorem trace surface for requirements

Does not own:

- new requirement definitions
- new theory
- JSON export
- regime/profile logic

Notes:

- This connects stable identifiers to formal results.
-/

namespace SEFormalContract.Requirement.Conformance

open SEFormalContract.Requirement.Spec

structure ConformanceEvidence where
  requirements_six :
    Req_FC_REQUIREMENTS_SIX ↔
      SEFormalContract.requirementCount = 6

end SEFormalContract.Requirement.Conformance
