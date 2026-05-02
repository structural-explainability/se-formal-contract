import SEFormalContract.Basic

/-!
File: SEFormalContract.Export.Core

Owns:
  - ProofStatus enumeration
  - ProofRecord structure
  - TheoremRecord structure

Does not own:
  - exported lists (those live in per-concern modules)
  - serialization logic
  - conformance predicates
-/

namespace SEFormalContract

inductive ProofStatus where
  | checked
  | pending
  | retired
deriving Repr, DecidableEq

structure ProofRecord where
  theoremId : TheoremId
  status    : ProofStatus
deriving Repr, DecidableEq

structure TheoremRecord where
  id               : TheoremId
  moduleName       : String
  declarationName  : String
  kind             : TheoremKind
  dependsOn        : List TheoremId
deriving Repr, DecidableEq

end SEFormalContract
