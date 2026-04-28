import SEFormalContract.Relation.Core

/-!
File: SEFormalContract.Relation.Spec

Owns:

- stable relation requirement identifiers
- relation requirement shapes

Does not own:

- relation primitive definitions
- theorem proofs
- JSON export
- mapping data
-/

namespace SEFormalContract.Relation.Spec

def FC_RELATIONS_ALLOWED_PRIMITIVES : String :=
  "FC.RELATIONS.ALLOWED_PRIMITIVES"

/-- REQ: FC.RELATIONS.ALLOWED_PRIMITIVES -/
def Req_FC_RELATIONS_ALLOWED_PRIMITIVES : Prop :=
  ∀ r : SEFormalContract.Relation, r.isAdmissible

end SEFormalContract.Relation.Spec
