"""cli.py.

Command-line interface for se-formal-contract.
"""

import argparse

from se_formal_contract.sync import sync_all
from se_formal_contract.validate import run_validate


def build_parser() -> argparse.ArgumentParser:
    """Build the command-line argument parser."""
    parser = argparse.ArgumentParser(
        prog="se-formal-contract",
        description="Validate and export the SE formal contract.",
    )

    subparsers = parser.add_subparsers(dest="command")

    validate_parser = subparsers.add_parser(
        "validate",
        help="Sync and validate formal contract artifacts.",
    )
    validate_parser.add_argument(
        "--require-tag",
        action="store_true",
        help="Require contract_version to match the current exact git tag.",
    )

    subparsers.add_parser(
        "sync",
        help="Sync SE_MANIFEST.toml and CITATION.cff from generated contract JSON.",
    )

    subparsers.add_parser(
        "export",
        help="Export operational contract artifacts.",
    )

    return parser


def main(argv: list[str] | None = None) -> int:
    """Run the command-line interface."""
    parser = build_parser()
    args = parser.parse_args(argv)

    try:
        if args.command == "validate":
            run_validate(require_tag=args.require_tag)
            return 0

        if args.command == "sync":
            sync_all()
            return 0

    except (ValueError, FileNotFoundError, RuntimeError) as e:
        print(f"Error: {e}")
        return 1

    parser.print_help()
    return 2


if __name__ == "__main__":
    raise SystemExit(main())
