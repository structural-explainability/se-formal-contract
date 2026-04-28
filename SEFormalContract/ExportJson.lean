import SEFormalContract.Export

namespace SEFormalContract

/-!
Exports the Python data needed

-/

def quoteJsonString (s : String) : String :=
  "\"" ++ s ++ "\""

def jsonArray (items : List String) : String :=
  "[" ++ String.intercalate ", " (items.map quoteJsonString) ++ "]"

def invariantIdToString : InvariantId -> String
  | InvariantId.formalContractIsRoot => "formal_contract_is_root"
  | InvariantId.noCycles => "no_cycles"
  | InvariantId.noReverseFoundationDependencies => "no_reverse_foundation_dependencies"
  | InvariantId.constitutionIsFoundational => "constitution_is_foundational"

def regimeToString : Regime -> String
  | Regime.OBL => "OBL"
  | Regime.OCC => "OCC"
  | Regime.REC => "REC"
  | Regime.ENR_L => "ENR-L"
  | Regime.ENR_I => "ENR-I"
  | Regime.CTX_E => "CTX-E"
  | Regime.CTX_S => "CTX-S"
  | Regime.NOR_C => "NOR-C"
  | Regime.NOR_S => "NOR-S"

def relationToString : Relation -> String
  | Relation.equivalent => "equivalent"
  | Relation.narrower => "narrower"
  | Relation.broader => "broader"
  | Relation.overlaps => "overlaps"
  | Relation.none => "none"

def proofStatusToString : ProofStatus -> String
  | ProofStatus.checked => "checked"
  | ProofStatus.pending => "pending"
  | ProofStatus.retired => "retired"

def theoremIdToString : TheoremId -> String
  | TheoremId.ontologicalNeutrality => "ontological_neutrality"
  | TheoremId.regimeNecessity => "regime_necessity"
  | TheoremId.regimeSufficiency => "regime_sufficiency"

def proofRecordToJson (p : ProofRecord) : String :=
  "    {\"id\": "
    ++ quoteJsonString (theoremIdToString p.theoremId)
    ++ ", \"status\": "
    ++ quoteJsonString (proofStatusToString p.status)
    ++ "}"

def invariantRegistryJson : String :=
  "{\n"
    ++ "  \"schema\": \"se-invariant-registry-1\",\n"
    ++ "  \"contract_version\": \"0.1.0\",\n"
    ++ "  \"invariants\": "
    ++ jsonArray (exportedInvariants.map invariantIdToString)
    ++ "\n}\n"

def regimeRegistryJson : String :=
  "{\n"
    ++ "  \"schema\": \"se-regime-registry-1\",\n"
    ++ "  \"contract_version\": \"0.1.0\",\n"
    ++ "  \"regimes\": "
    ++ jsonArray (exportedRegimes.map regimeToString)
    ++ "\n}\n"

def relationRegistryJson : String :=
  "{\n"
    ++ "  \"schema\": \"se-relation-registry-1\",\n"
    ++ "  \"contract_version\": \"0.1.0\",\n"
    ++ "  \"relations\": "
    ++ jsonArray (exportedRelations.map relationToString)
    ++ "\n}\n"

def proofRegistryJson : String :=
  "{\n"
    ++ "  \"schema\": \"se-proof-registry-1\",\n"
    ++ "  \"contract_version\": \"0.1.0\",\n"
    ++ "  \"proofs\": [\n"
    ++ String.intercalate ",\n" (exportedProofs.map proofRecordToJson)
    ++ "\n  ]\n}\n"

def writeContractJson : IO Unit := do
  IO.FS.createDirAll "data/contract"
  IO.FS.writeFile "data/contract/invariant-registry.json" invariantRegistryJson
  IO.println "[export] wrote data/contract/invariant-registry.json"
  IO.FS.writeFile "data/contract/regime-registry.json" regimeRegistryJson
  IO.println "[export] wrote data/contract/regime-registry.json"
  IO.FS.writeFile "data/contract/relation-registry.json" relationRegistryJson
  IO.println "[export] wrote data/contract/relation-registry.json"
  IO.FS.writeFile "data/contract/proof-registry.json" proofRegistryJson
  IO.println "[export] wrote data/contract/proof-registry.json"
  IO.println "[export] completed"

end SEFormalContract
