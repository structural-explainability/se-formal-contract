"""sync.py.

Syncs SE_MANIFEST.toml, CITATION.cff, and pyproject.toml
CITATION.cff, and pyproject.toml
from generated contract JSON.

Called automatically by run_validate before any validation checks.
"""

from datetime import date
from pathlib import Path
import re

from .load import load


def read_contract_version() -> str:
    """Read canonical contract version from generated JSON.

    invariant-registry.json is authoritative - run `lake exe export_contract` first.
    """
    path = Path("data/contract/invariant-registry.json")
    if not path.exists():
        raise FileNotFoundError(
            "data/contract/invariant-registry.json not found"
            " - run `lake exe export_contract` first"
        )
    data = load(path)
    version = data.get("contract_version")
    if not isinstance(version, str):
        raise ValueError("invariant-registry.json missing or invalid contract_version")
    return version


def sync_manifest(version: str) -> None:
    """Update contract_version in SE_MANIFEST.toml to match generated JSON."""
    path = Path("SE_MANIFEST.toml")
    if not path.exists():
        raise FileNotFoundError("SE_MANIFEST.toml not found")

    text = path.read_text(encoding="utf-8")
    updated, count = re.subn(
        r'(contract_version\s*=\s*")[^"]*(")',
        rf"\g<1>{version}\g<2>",
        text,
    )
    if count == 0:
        raise ValueError(
            "SE_MANIFEST.toml: could not find contract_version field to update"
        )
    if count > 1:
        raise ValueError(
            f"SE_MANIFEST.toml: found {count} contract_version fields - expected exactly 1"
        )
    path.write_text(updated, encoding="utf-8")


def sync_citation(version: str) -> None:
    """Update version and date-released in CITATION.cff to match generated JSON."""
    path = Path("CITATION.cff")
    if not path.exists():
        raise FileNotFoundError("CITATION.cff not found")

    text = path.read_text(encoding="utf-8")

    text, count_v = re.subn(
        r"(^version:\s*)[^\n]+",
        rf"\g<1>{version}",
        text,
        flags=re.MULTILINE,
    )
    if count_v != 1:
        raise ValueError(f"CITATION.cff: expected 1 version field, found {count_v}")

    today = date.today().isoformat()
    text, count_d = re.subn(
        r"(^date-released:\s*)[^\n]+",
        rf"\g<1>{today}",
        text,
        flags=re.MULTILINE,
    )
    if count_d != 1:
        raise ValueError(
            f"CITATION.cff: expected 1 date-released field, found {count_d}"
        )

    path.write_text(text, encoding="utf-8")


def sync_pyproject(version: str) -> None:
    """Update fallback-version in pyproject.toml to match generated JSON."""
    path = Path("pyproject.toml")
    if not path.exists():
        raise FileNotFoundError("pyproject.toml not found")

    text = path.read_text(encoding="utf-8")
    updated, count = re.subn(
        r'(fallback-version\s*=\s*")[^"]*(")',
        rf"\g<1>{version}\g<2>",
        text,
    )
    if count == 0:
        raise ValueError(
            "pyproject.toml: could not find fallback-version field to update"
        )
    if count > 1:
        raise ValueError(
            f"pyproject.toml: found {count} fallback-version fields - expected exactly 1"
        )
    path.write_text(updated, encoding="utf-8")


def sync_all() -> None:
    """Sync SE_MANIFEST.toml, CITATION.cff, and pyproject.toml from generated contract JSON."""
    version = read_contract_version()
    sync_manifest(version)
    sync_citation(version)
    sync_pyproject(version)
    print(
        f"[sync] SE_MANIFEST.toml, CITATION.cff, and pyproject.toml updated to {version}"
    )
