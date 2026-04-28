import SEFormalContract.Basic

/-!
File: SEFormalContract.Regime.Core

Owns:

- identity regime profile enumeration
- regime admissibility predicate
- regime-level theorem statements/proofs

Does not own:

- requirement identifiers
- conformance trace records
- JSON export
- domain-specific identity examples
- interpretation semantics

Notes:

- Must align exactly with canonical regime profile definitions.
- Do not introduce alternative naming or synonyms.
- No "actor" terminology is permitted.
-/

namespace SEFormalContract

inductive Regime where
  | OBL
  | OCC
  | REC
  | ENR_L
  | ENR_I
  | CTX_E
  | CTX_S
  | NOR_C
  | NOR_S
deriving Repr, DecidableEq

def Regime.isAdmissible (_r : Regime) : Prop :=
  True

theorem allRegimesAdmissible (r : Regime) : r.isAdmissible := by
  trivial

def exportedRegimeProfileCount : Nat :=
  9

theorem exportedRegimeProfileCount_is_nine :
    exportedRegimeProfileCount = 9 := by
  rfl

end SEFormalContract
