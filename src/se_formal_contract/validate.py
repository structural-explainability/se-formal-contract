"""validate.py.

Validation logic for the SE formal contract,
including checks for version alignment and registry integrity.
"""

from pathlib import Path
from typing import Any, cast

import yaml

from se_formal_contract.sync import sync_all

from .load import get_git_tag, load, load_manifest, require_keys


def validate_citation_version(manifest: dict[str, Any]) -> None:
    """Ensure CITATION.cff version matches contract_version."""
    path = Path("CITATION.cff")
    if not path.exists():
        raise FileNotFoundError("CITATION.cff not found")

    raw = yaml.safe_load(path.read_text(encoding="utf-8"))

    if not isinstance(raw, dict):
        raise ValueError("CITATION.cff must contain a YAML mapping at the top level")

    typed: dict[str, object] = cast(dict[str, object], raw)

    cff_version = typed.get("version")
    if not isinstance(cff_version, str):
        raise ValueError("CITATION.cff missing or invalid 'version'")

    contract = manifest.get("contract")
    if not isinstance(contract, dict):
        raise ValueError("Missing or invalid [contract] section in manifest")

    typed_contract: dict[str, object] = cast(dict[str, object], contract)

    version = typed_contract.get("contract_version")
    if not isinstance(version, str):
        raise ValueError("Missing or invalid contract.contract_version")

    if cff_version != version:
        raise ValueError(
            f"CITATION.cff version ({cff_version}) "
            f"does not match contract_version ({version})"
        )


def validate_contract_version(manifest: dict[str, Any]) -> None:
    """Ensure contract_version matches git tag."""
    contract = manifest.get("contract")
    if contract is None:
        raise ValueError("Missing [contract] section in manifest")

    version = contract.get("contract_version")
    if not version:
        raise ValueError("Missing contract.contract_version")

    tag = get_git_tag()
    expected = f"v{version}"

    if tag != expected:
        raise ValueError(f"contract_version ({version}) does not match git tag ({tag})")


def validate_exports_exist(manifest: dict[str, Any]) -> None:
    """Ensure exported paths exist and are files."""
    exports = manifest.get("exports")
    if not exports:
        raise ValueError("Missing [exports] section in manifest")

    for name, rel_path in exports.items():
        path = Path(rel_path)
        if not path.exists():
            raise FileNotFoundError(f"Missing export: {name} -> {rel_path}")
        if not path.is_file():
            raise ValueError(f"Export is not a file: {name} -> {rel_path}")


def validate_registries(root: Path) -> None:
    """Validate JSON registry structure."""
    inv = load(root / "invariant-registry.json")
    reg = load(root / "regime-registry.json")
    rel = load(root / "relation-registry.json")
    prf = load(root / "proof-registry.json")

    require_keys(inv, ["schema", "invariants"], "invariant-registry")
    require_keys(reg, ["schema", "regimes"], "regime-registry")
    require_keys(rel, ["schema", "relations"], "relation-registry")
    require_keys(prf, ["schema", "proofs"], "proof-registry")

    # enforce non-empty + uniqueness
    if len(set(inv["invariants"])) != len(inv["invariants"]):
        raise ValueError("Duplicate invariants detected")

    if len(set(reg["regimes"])) != len(reg["regimes"]):
        raise ValueError("Duplicate regimes detected")

    if len(set(rel["relations"])) != len(rel["relations"]):
        raise ValueError("Duplicate relations detected")


# === Entry point ===


def run_validate(*, require_tag: bool = False) -> None:
    """Run the full validation process.

    Args:
        *: All args after this are keyword-only.
        require_tag: If True, enforce that contract_version matches git tag.
    """
    sync_all()  # always sync before reading manifest
    manifest = load_manifest()

    if require_tag:
        validate_citation_version(manifest)
        validate_contract_version(manifest)

    validate_exports_exist(manifest)
    validate_registries(Path("data/contract"))

    print("Formal contract validation passed.")
