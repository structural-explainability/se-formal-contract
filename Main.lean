import SEFormalContract.ExportJson

/-!
File: Main

Provides an executable entry point for generating the JSON representation of the formal contract.
-/

def main : IO Unit :=
  SEFormalContract.writeContractJson
