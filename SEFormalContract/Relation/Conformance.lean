import SEFormalContract.Relation.Core
import SEFormalContract.Relation.Spec

/-!
File: SEFormalContract.Relation.Conformance

Owns:

- identifier-to-theorem trace surface for relation requirements

Does not own:

- new relation primitives
- new theory
- JSON export
- mapping data
-/

namespace SEFormalContract.Relation.Conformance

open SEFormalContract.Relation.Spec

structure ConformanceEvidence where
  relations_allowed_primitives :
    Req_FC_RELATIONS_ALLOWED_PRIMITIVES ↔
      (∀ r : SEFormalContract.Relation, r.isAdmissible)

end SEFormalContract.Relation.Conformance
