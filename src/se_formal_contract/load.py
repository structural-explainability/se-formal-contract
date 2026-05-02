"""load.py.

Loading and parsing logic for the SE formal contract, including manifest handling
"""

import json
from pathlib import Path
import shutil
import subprocess
from typing import Any


def load(path: Path) -> dict[str, Any]:
    """Load and return JSON data from the specified path."""
    return json.loads(path.read_text(encoding="utf-8"))


def require_keys(obj: dict[str, Any], keys: list[str], name: str) -> None:
    """Require that the given object has the specified keys."""
    missing: list[str] = [k for k in keys if k not in obj]
    if missing:
        raise ValueError(f"{name} missing keys: {missing}")


def get_git_tag() -> str:
    """Return the current git tag (exact match required)."""
    git = shutil.which("git")
    if git is None:
        raise RuntimeError("git executable not found on PATH")

    try:
        return (
            subprocess.check_output(  # noqa: S603
                [git, "describe", "--tags", "--exact-match"],
                stderr=subprocess.DEVNULL,
            )
            .decode("utf-8")
            .strip()
        )
    except subprocess.CalledProcessError as exc:
        raise RuntimeError("Repository is not on a tagged commit") from exc


def load_manifest() -> dict[str, Any]:
    """Load SE_MANIFEST.toml (minimal parse via stdlib)."""
    import tomlkit  # Python 3.11+

    path = Path("SE_MANIFEST.toml")
    if not path.exists():
        raise FileNotFoundError("SE_MANIFEST.toml not found")

    return tomlkit.parse(path.read_text(encoding="utf-8"))
