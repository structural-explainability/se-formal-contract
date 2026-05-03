import SEFormalContract.Vocab.Basic
import SEFormalContract.Export
import SEFormalContract.ExportJson
import SEFormalContract.Neutrality
import SEFormalContract.RegimeProfile
import SEFormalContract.Relation
import SEFormalContract.Requirement
import SEFormalContract.Theorems

/-!
File: SEFormalContract.Surface
Owns:
- public library root
- re-export of all modules
Does not own:
- definitions
- theorems
- operational logic
Notes:
- This is the single import surface for downstream users.
- Must remain thin: imports only, no logic.
-/
