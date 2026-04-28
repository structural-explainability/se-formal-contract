# tests/test_app.py

from se_formal_contract.app import run_validate


def test_run_validate_smoke() -> None:
    run_validate()
