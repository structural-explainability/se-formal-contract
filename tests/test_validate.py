from pathlib import Path

import pytest

from se_formal_contract import app
from se_formal_contract.validate import (
    validate_citation_version,
    validate_contract_version,
    validate_exports_exist,
)


def test_validate_citation_version_matches(tmp_path, monkeypatch):
    monkeypatch.chdir(tmp_path)

    Path("CITATION.cff").write_text(
        'cff-version: "1.2.0"\n'
        "type: software\n"
        'title: "Structural Explainability Formal Contract"\n'
        'version: "0.2.0"\n',
        encoding="utf-8",
    )

    manifest = {"contract": {"contract_version": "0.2.0"}}

    validate_citation_version(manifest)


def test_validate_citation_version_rejects_mismatch(tmp_path, monkeypatch):
    monkeypatch.chdir(tmp_path)

    Path("CITATION.cff").write_text(
        'cff-version: "1.2.0"\n'
        "type: software\n"
        'title: "Structural Explainability Formal Contract"\n'
        'version: "0.1.0"\n',
        encoding="utf-8",
    )

    manifest = {"contract": {"contract_version": "0.2.0"}}

    with pytest.raises(ValueError, match="does not match contract_version"):
        validate_citation_version(manifest)


def test_validate_contract_version_matches_tag(monkeypatch):
    monkeypatch.setattr(app, "get_git_tag", lambda: "v0.2.0")

    manifest = {"contract": {"contract_version": "0.2.0"}}

    validate_contract_version(manifest)


def test_validate_contract_version_rejects_tag_mismatch(monkeypatch):
    monkeypatch.setattr(app, "get_git_tag", lambda: "v0.1.0")

    manifest = {"contract": {"contract_version": "0.2.0"}}

    with pytest.raises(ValueError, match="does not match git tag"):
        validate_contract_version(manifest)


def test_validate_exports_exist(tmp_path, monkeypatch):
    monkeypatch.chdir(tmp_path)

    path = Path("data/contract")
    path.mkdir(parents=True)
    (path / "invariant-registry.json").write_text("{}", encoding="utf-8")

    manifest = {
        "exports": {
            "invariants": "data/contract/invariant-registry.json",
        }
    }

    validate_exports_exist(manifest)


def test_validate_exports_exist_rejects_missing_file(tmp_path, monkeypatch):
    monkeypatch.chdir(tmp_path)

    manifest = {
        "exports": {
            "invariants": "data/contract/invariant-registry.json",
        }
    }

    with pytest.raises(FileNotFoundError, match="Missing export"):
        validate_exports_exist(manifest)
