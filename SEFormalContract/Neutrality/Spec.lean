import SEFormalContract.Neutrality.Core

/-!
File: SEFormalContract.Neutrality.Spec

Owns:

- stable neutrality requirement identifiers
- requirement shapes (Props)

Does not own:

- substrate structure
- theorem proofs
- JSON export
-/

namespace SEFormalContract.Neutrality.Spec

def FC_NEUTRALITY_PRECAUSAL : String :=
  "FC.NEUTRALITY.PRECAUSAL"

def FC_NEUTRALITY_PRENORMATIVE : String :=
  "FC.NEUTRALITY.PRENORMATIVE"

def FC_NEUTRALITY_DEFINITION : String :=
  "FC.NEUTRALITY.DEFINITION"

/-- REQ: FC.NEUTRALITY.PRECAUSAL -/
def Req_FC_NEUTRALITY_PRECAUSAL : Prop :=
  ∀ s : SEFormalContract.Substrate,
    SEFormalContract.OntologicallyNeutral s → SEFormalContract.PreCausal s

/-- REQ: FC.NEUTRALITY.PRENORMATIVE -/
def Req_FC_NEUTRALITY_PRENORMATIVE : Prop :=
  ∀ s : SEFormalContract.Substrate,
    SEFormalContract.OntologicallyNeutral s → SEFormalContract.PreNormative s

/-- REQ: FC.NEUTRALITY.DEFINITION -/
def Req_FC_NEUTRALITY_DEFINITION : Prop :=
  ∀ s : SEFormalContract.Substrate,
    SEFormalContract.OntologicallyNeutral s ↔
      (SEFormalContract.PreCausal s ∧ SEFormalContract.PreNormative s)

end SEFormalContract.Neutrality.Spec
