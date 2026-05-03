import SEFormalContract.Vocab.Requirements

/-!
File: SEFormalContract.Requirement.Spec

Owns:

- stable requirement identifiers
- requirement-level specification predicates

Does not own:

- requirement enumeration definitions
- theorem proofs
- JSON export
- regime/profile definitions

Notes:

- Identifiers must remain stable once published.
- These identifiers are used by downstream systems for traceability.
-/

namespace SEFormalContract.Requirement.Spec

def FC_REQUIREMENTS_SIX : String :=
  "FC.REQUIREMENTS.SIX"

/-- REQ: FC.REQUIREMENTS.SIX -/
def Req_FC_REQUIREMENTS_SIX : Prop :=
  SEFormalContract.requirementCount = 6

end SEFormalContract.Requirement.Spec
