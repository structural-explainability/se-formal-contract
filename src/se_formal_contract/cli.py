"""cli.py - Command-line interface for se-formal-contract."""

import argparse

from se_formal_contract.app import run_validate


def build_parser() -> argparse.ArgumentParser:
    """Build the command-line argument parser."""
    parser = argparse.ArgumentParser(
        prog="se-formal-contract",
        description="Validate and export the SE formal contract.",
    )

    subparsers = parser.add_subparsers(dest="command")

    subparsers.add_parser(
        "validate",
        help="Validate formal contract artifacts.",
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

    if args.command == "validate":
        run_validate()
        return 0

    parser.print_help()
    return 2


if __name__ == "__main__":
    raise SystemExit(main())
