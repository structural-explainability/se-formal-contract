import SEFormalContract.Basic
import SEFormalContract.Regime
import SEFormalContract.Relation
import SEFormalContract.Neutrality

namespace SEFormalContract

/-!
File: SEFormalContract.Export

Owns:

- contract-facing declarations intended for export
- invariant, regime, relation, and theorem registries
- proof status surface
- stable boundary between formal layer and operational layer

Does not own:

- new theory or definitions
- theorem proofs not required for contract export
- operational validation logic
- domain semantics or mappings

Notes:

- This file defines what is visible to the operational layer.
- Exported structures must remain stable across versions.
- Changes here have downstream impact and require versioning discipline.
-/

inductive ProofStatus where
  | checked
  | pending
  | retired
deriving Repr, DecidableEq

structure ProofRecord where
  theoremId : TheoremId
  status : ProofStatus
deriving Repr, DecidableEq

def exportedInvariants : List InvariantId :=
  [
    InvariantId.formalContractIsRoot,
    InvariantId.noCycles,
    InvariantId.noReverseFoundationDependencies,
    InvariantId.constitutionIsFoundational
  ]

def exportedRegimes : List Regime :=
  [
    Regime.OBL,
    Regime.OCC,
    Regime.REC,
    Regime.ENR_L,
    Regime.ENR_I,
    Regime.CTX_E,
    Regime.CTX_S,
    Regime.NOR_C,
    Regime.NOR_S
  ]

def exportedRelations : List Relation :=
  [
    Relation.equivalent,
    Relation.narrower,
    Relation.broader,
    Relation.overlaps,
    Relation.none
  ]

def exportedProofs : List ProofRecord :=
  [
    { theoremId := TheoremId.ontologicalNeutrality, status := ProofStatus.pending },
    { theoremId := TheoremId.regimeNecessity, status := ProofStatus.pending },
    { theoremId := TheoremId.regimeSufficiency, status := ProofStatus.pending }
  ]

end SEFormalContract
