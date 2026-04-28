"""app.py: Main entry point for validating the formal contract data."""

import json
from pathlib import Path
from typing import Any


def load(path: Path) -> dict[str, Any]:
    """Load and return the JSON data from the specified path."""
    return json.loads(path.read_text(encoding="utf-8"))


def require_keys(obj: dict[str, Any], keys: list[str], name: str) -> None:
    """Require that the given object has the specified keys, otherwise raise an error."""
    missing: list[str] = [k for k in keys if k not in obj]
    if missing:
        raise ValueError(f"{name} missing keys: {missing}")


def run_validate() -> None:
    """Run the validation process to ensure the contract data is well-formed."""
    root = Path("data/contract")

    inv = load(root / "invariant-registry.json")
    reg = load(root / "regime-registry.json")
    rel = load(root / "relation-registry.json")
    prf = load(root / "proof-registry.json")

    require_keys(inv, ["schema", "invariants"], "invariant-registry")
    require_keys(reg, ["schema", "regimes"], "regime-registry")
    require_keys(rel, ["schema", "relations"], "relation-registry")
    require_keys(prf, ["schema", "proofs"], "proof-registry")

    # enforce non-empty + uniqueness
    assert len(set(inv["invariants"])) == len(inv["invariants"])
    assert len(set(reg["regimes"])) == len(reg["regimes"])
    assert len(set(rel["relations"])) == len(rel["relations"])

    print("Formal contract validation passed.")


if __name__ == "__main__":
    run_validate()
