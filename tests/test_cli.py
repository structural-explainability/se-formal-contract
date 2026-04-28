# tests/test_cli.py

import subprocess
import sys


def test_cli_validate_smoke() -> None:
    result = subprocess.run(
        [sys.executable, "-m", "se_formal_contract.app"],
        check=False,
        capture_output=True,
        text=True,
    )

    assert result.returncode == 0
    assert "Formal contract validation passed." in result.stdout
