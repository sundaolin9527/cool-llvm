#!/usr/bin/env bash
set -euo pipefail

bash scripts/ci/install_ubuntu2004_llvm1606.sh

export PATH="/usr/lib/llvm-16/bin:${PATH}"

make all
make runtime-lib
make test-units
make test-pass
