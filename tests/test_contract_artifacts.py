"""Tests for generated formal contract artifacts."""

import json
from pathlib import Path
from typing import Any

CONTRACT_DIR = Path("data/contract")


def load_json(name: str) -> dict[str, Any]:
    """Load one generated contract artifact."""
    path = CONTRACT_DIR / name
    return json.loads(path.read_text(encoding="utf-8"))


def assert_unique(values: list[str], label: str) -> None:
    """Assert all values are unique."""
    assert len(values) == len(set(values)), f"{label} contains duplicates"


def get_str_list(obj: dict[str, Any], key: str) -> list[str]:
    """Extract a list[str] from JSON with validation."""
    value = obj.get(key)
    assert isinstance(value, list), f"{key} must be a list"
    assert all(isinstance(v, str) for v in value if isinstance(v, object)), (
        f"{key} must contain strings"
    )
    return value  # type: ignore[return-value]


def get_proofs(obj: dict[str, Any]) -> list[dict[str, str]]:
    """Extract proof list with validation."""
    value = obj.get("proofs")
    assert isinstance(value, list), "proofs must be a list"

    for item in value:
        assert isinstance(item, dict), "proof must be an object"
        assert isinstance(item.get("id"), str)
        assert isinstance(item.get("status"), str)

    return value


def test_invariant_registry_structure() -> None:
    """Invariant registry has required keys and unique values."""
    data = load_json("invariant-registry.json")

    assert data["schema"] == "se-invariant-registry-1"
    assert data["contract_version"] == "0.1.0"
    assert isinstance(data["invariants"], list)
    invariants = get_str_list(data, "invariants")
    assert_unique(invariants, "invariants")


def test_regime_registry_structure() -> None:
    """Regime registry has required keys and unique values."""
    data = load_json("regime-registry.json")

    assert data["schema"] == "se-regime-registry-1"
    assert data["contract_version"] == "0.1.0"
    assert isinstance(data["regimes"], list)
    assert_unique(data["regimes"], "regimes")


def test_relation_registry_structure() -> None:
    """Relation registry has required keys and unique values."""
    data = load_json("relation-registry.json")

    assert data["schema"] == "se-relation-registry-1"
    assert data["contract_version"] == "0.1.0"
    assert isinstance(data["relations"], list)
    assert_unique(data["relations"], "relations")


def test_proof_registry_structure() -> None:
    """Proof registry has required keys and unique proof IDs."""
    data = load_json("proof-registry.json")

    assert data["schema"] == "se-proof-registry-1"
    assert data["contract_version"] == "0.1.0"
    assert isinstance(data["proofs"], list)

    proofs = get_proofs(data)
    proof_ids = [p["id"] for p in proofs]
    assert_unique(proof_ids, "proof ids")

    for proof in proofs:
        assert set(proof) == {"id", "status"}
        assert proof["status"] in {"checked", "pending", "retired"}
