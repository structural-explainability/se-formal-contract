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

def regimeToString : RegimeProfile -> String
  | RegimeProfile.OBL   => "OBL"
  | RegimeProfile.OCC   => "OCC"
  | RegimeProfile.REC   => "REC"
  | RegimeProfile.ENR_L => "ENR-L"
  | RegimeProfile.ENR_I => "ENR-I"
  | RegimeProfile.CTX_E => "CTX-E"
  | RegimeProfile.CTX_S => "CTX-S"
  | RegimeProfile.NOR_C => "NOR-C"
  | RegimeProfile.NOR_S => "NOR-S"

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

def theoremKindToString : TheoremKind -> String
  | TheoremKind.theorem => "theorem"
  | TheoremKind.lemma   => "lemma"
  | TheoremKind.axiom   => "axiom"

def versionString : String :=
  let v := currentContractVersion
  s!"{v.major}.{v.minor}.{v.patch}"

def proofRecordToJson (p : ProofRecord) : String :=
  "    {\"id\": "
    ++ quoteJsonString (theoremIdToString p.theoremId)
    ++ ", \"status\": "
    ++ quoteJsonString (proofStatusToString p.status)
    ++ "}"

def theoremRecordToJson (t : TheoremRecord) : String :=
  "    {\"id\": "
    ++ quoteJsonString (theoremIdToString t.id)
    ++ ", \"module\": "
    ++ quoteJsonString t.moduleName
    ++ ", \"declaration\": "
    ++ quoteJsonString t.declarationName
    ++ ", \"kind\": "
    ++ quoteJsonString (theoremKindToString t.kind)
    ++ ", \"depends_on\": "
    ++ jsonArray (t.dependsOn.map theoremIdToString)
    ++ "}"

def invariantRegistryJson : String :=
  "{\n"
    ++ "  \"schema\": \"se-invariant-registry-1\",\n"
    ++ "  \"contract_version\": \"" ++ versionString ++ "\",\n"
    ++ "  \"invariants\": "
    ++ jsonArray (exportedInvariants.map invariantIdToString)
    ++ "\n}\n"

def regimeRegistryJson : String :=
  "{\n"
    ++ "  \"schema\": \"se-regime-registry-1\",\n"
    ++ "  \"contract_version\": \"" ++ versionString ++ "\",\n"
    ++ "  \"regimes\": "
    ++ jsonArray (exportedRegimes.map regimeToString)
    ++ "\n}\n"

def relationRegistryJson : String :=
  "{\n"
    ++ "  \"schema\": \"se-relation-registry-1\",\n"
    ++ "  \"contract_version\": \"" ++ versionString ++ "\",\n"
    ++ "  \"relations\": "
    ++ jsonArray (exportedRelations.map relationToString)
    ++ "\n}\n"

def proofRegistryJson : String :=
  "{\n"
    ++ "  \"schema\": \"se-proof-registry-1\",\n"
    ++ "  \"contract_version\": \"" ++ versionString ++ "\",\n"
    ++ "  \"proofs\": [\n"
    ++ String.intercalate ",\n" (exportedProofs.map proofRecordToJson)
    ++ "\n  ]\n}\n"

def theoremsJson : String :=
  "{\n"
    ++ "  \"schema\": \"se-theorem-registry-1\",\n"
    ++ "  \"contract_version\": \"" ++ versionString ++ "\",\n"
    ++ "  \"theorems\": [\n"
    ++ String.intercalate ",\n" (exportedTheorems.map theoremRecordToJson)
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
  IO.FS.writeFile "data/contract/theorem-registry.json" theoremsJson
  IO.println "[export] wrote data/contract/theorem-registry.json"
  IO.println "[export] completed"

end SEFormalContract
