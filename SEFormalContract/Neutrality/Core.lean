import SEFormalContract.Vocab.Basic

/-!
File: SEFormalContract.Neutrality.Core

Owns:
  - substrate structure
  - neutrality predicate
  - pre-causal and pre-normative constraints
  - theorem statements/proofs

Does not own:

- requirement identifiers
- conformance trace records
- JSON export
- governance or explanation semantics

TODO:
   These predicates define the initial formal-contract surface.
   They are intentionally minimal placeholders until migrated theorem
   content from NeutralSubstrate is incorporated.
-/

namespace SEFormalContract

structure Substrate where
  name : String
deriving Repr, DecidableEq

def PreCausal (_s : Substrate) : Prop :=
  True

def PreNormative (_s : Substrate) : Prop :=
  True

def OntologicallyNeutral (s : Substrate) : Prop :=
  PreCausal s ∧ PreNormative s

theorem neutralityRequiresPreCausal
    {s : Substrate}
    (h : OntologicallyNeutral s) :
    PreCausal s :=
  h.left

theorem neutralityRequiresPreNormative
    {s : Substrate}
    (h : OntologicallyNeutral s) :
    PreNormative s :=
  h.right

end SEFormalContract
