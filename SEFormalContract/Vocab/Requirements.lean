import SEFormalContract.Vocab.Basic

/-!
File: SEFormalContract.Requirements

Owns:

- structural requirement enumeration (R1–R6)
- requirement-level predicates (if needed later)
- requirement count / structural facts

Does not own:

- regime/profile definitions
- requirement identifiers (strings)
- conformance trace records
- JSON export

Notes:

- R1 is a global constraint; R2–R6 are representational capacities.
- Requirements are structural, not interpretive.
- This layer defines the minimal capacities required for neutral substrates.
-/

namespace SEFormalContract

inductive Requirement where
  | R1  -- stable identity and persistence (global constraint)
  | R2  -- obligation-bearing capacity
  | R3  -- normative reference without execution
  | R4  -- time-indexed occurrence
  | R5  -- applicability and scope
  | R6  -- descriptive indicators without causal commitment
deriving Repr, DecidableEq

def requirementCount : Nat :=
  6

theorem requirementCount_is_six :
    requirementCount = 6 := by
  rfl

end SEFormalContract
