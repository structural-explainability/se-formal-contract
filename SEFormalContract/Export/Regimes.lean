import SEFormalContract.RegimeProfile

/-!
File: SEFormalContract.Export.Regimes

Owns:
  - exportedRegimes list
-/

namespace SEFormalContract

def exportedRegimes : List RegimeProfile :=
  [
    RegimeProfile.OBL,
    RegimeProfile.OCC,
    RegimeProfile.REC,
    RegimeProfile.ENR_L,
    RegimeProfile.ENR_I,
    RegimeProfile.CTX_E,
    RegimeProfile.CTX_S,
    RegimeProfile.NOR_C,
    RegimeProfile.NOR_S
  ]

end SEFormalContract
