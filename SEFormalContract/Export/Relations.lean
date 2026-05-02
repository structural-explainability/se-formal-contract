import SEFormalContract.Relation

/-!
File: SEFormalContract.Export.Relations

Owns:
  - exportedRelations list
-/

namespace SEFormalContract

def exportedRelations : List Relation :=
  [
    Relation.equivalent,
    Relation.narrower,
    Relation.broader,
    Relation.overlaps,
    Relation.none
  ]

end SEFormalContract
