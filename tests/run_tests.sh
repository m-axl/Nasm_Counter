#!/usr/bin/env bash
set -euo pipefail
echo "Running tests..."
make -f build/makefile

printf "3\n" | ./contador_bshasm > tests/out.txt

if grep -q "4" tests/out.txt; then
  echo "TEST PASSED"
  exit 0
else
  echo "TEST FAILED"
  cat tests/out.txt
  exit 2
fi
