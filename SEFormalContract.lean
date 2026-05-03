import SEFormalContract.Surface

/-!
File: SEFormalContract

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
