import SEFormalContract.Basic

/-!
File: SEFormalContract.RegimeProfile.Core

Owns:

- regime profile enumeration (final contract surface)
- regime profile admissibility predicate
- structural facts about regime profiles (e.g., count)

Does not own:

- requirement identifiers (strings)
- conformance trace records
- JSON export
- derivation from R1–R6 (that lives in theory layer, not contract layer)

Notes:

- These are the final identity-and-persistence profiles exposed by the contract.
- They are derived from structural requirements (R1–R6) plus refinement pressure.
- Naming must remain stable once published.
-/

namespace SEFormalContract

/-- Canonical identity-and-persistence regime profiles. -/
inductive RegimeProfile where
  | OBL    -- obligation-bearing entity
  | OCC    -- time-indexed occurrence
  | REC    -- descriptive record
  | ENR_L  -- enduring referent (locus-based)
  | ENR_I  -- enduring referent (identity-based)
  | CTX_E  -- applicability context (extensional)
  | CTX_S  -- applicability context (structural)
  | NOR_C  -- normative structure (content-based)
  | NOR_S  -- normative structure (structural)
deriving Repr, DecidableEq

/-- Admissibility predicate for regime profiles. -/
def RegimeProfile.isAdmissible (_r : RegimeProfile) : Prop :=
  True

/-- All regime profiles are admissible (contract-level fact). -/
theorem allRegimeProfilesAdmissible (r : RegimeProfile) :
    r.isAdmissible := by
  trivial

/-- Number of exported regime profiles. -/
def exportedRegimeProfileCount : Nat :=
  9

theorem exportedRegimeProfileCount_is_nine :
    exportedRegimeProfileCount = 9 := by
  rfl

end SEFormalContract
