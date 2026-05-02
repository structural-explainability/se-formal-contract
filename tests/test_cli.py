# tests/test_cli.py


from se_formal_contract import cli


def test_cli_validate(monkeypatch):
    called = {}

    def fake_run_validate(*, require_tag=False):
        called["require_tag"] = require_tag

    monkeypatch.setattr(cli, "run_validate", fake_run_validate)

    assert cli.main(["validate"]) == 0
    assert called["require_tag"] is False


def test_cli_validate_require_tag(monkeypatch):
    called = {}

    def fake_run_validate(*, require_tag=False):
        called["require_tag"] = require_tag

    monkeypatch.setattr(cli, "run_validate", fake_run_validate)

    assert cli.main(["validate", "--require-tag"]) == 0
    assert called["require_tag"] is True
