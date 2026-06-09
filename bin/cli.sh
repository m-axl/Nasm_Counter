#!/usr/bin/env bash
set -euo pipefail

PROG_NAME=$(basename "$0")
ROOT_DIR=$(cd "$(dirname "$0")/.." && pwd)
cd "$ROOT_DIR"

usage(){
  cat <<EOF
Usage: $PROG_NAME <command> [options]

Commands:
  build             Build the project (uses build/makefile)
  run [opts]        Run built binary. Options:
      -i, --input "TEXT"    Provide input text to program
      -f, --file FILE        Read input from FILE
  clean             Clean build artifacts
  help              Show this help

Examples:
  $PROG_NAME build
  $PROG_NAME run -i "3"
  $PROG_NAME run -f tests/fixtures/input1.txt

EOF
}

if [ $# -lt 1 ]; then
  usage
  exit 1
fi

cmd=$1; shift
case "$cmd" in
  build)
    make -f build/makefile
    ;;
  clean)
    make -f build/makefile clean || true
    ;;
  run)
    input=""
    infile=""
    while [[ $# -gt 0 ]]; do
      case "$1" in
        -i|--input)
          input="$2"; shift 2;;
        -f|--file)
          infile="$2"; shift 2;;
        -h|--help)
          usage; exit 0;;
        *) echo "Unknown option: $1"; usage; exit 2;;
      esac
    done

    if [ ! -x ./contador_bshasm ]; then
      echo "Binary not found, building..."
      make -f build/makefile
    fi

    if [ -n "$infile" ]; then
      ./contador_bshasm < "$infile"
    else
      if [ -n "$input" ]; then
        printf "%s\n" "$input" | ./contador_bshasm
      else
        ./contador_bshasm
      fi
    fi
    ;;
  help|-h|--help)
    usage
    ;;
  *)
    echo "Unknown command: $cmd"; usage; exit 2
    ;;
esac
