#!/usr/bin/env bash
set -euo pipefail

if [[ -r /etc/os-release ]]; then
  # shellcheck disable=SC1091
  source /etc/os-release
else
  echo "Cannot read /etc/os-release" >&2
  exit 1
fi

if [[ "${ID:-}" != "ubuntu" || "${VERSION_ID:-}" != "20.04" ]]; then
  echo "This CI job requires Ubuntu 20.04, current system is ${PRETTY_NAME:-unknown}." >&2
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get install -y \
  apt-transport-https \
  build-essential \
  ca-certificates \
  curl \
  flex \
  bison \
  g++ \
  gcc \
  gnupg \
  libfl-dev \
  lsb-release \
  make \
  software-properties-common \
  wget

current_llvm_version=""
if command -v llvm-config-16 >/dev/null 2>&1; then
  current_llvm_version="$(llvm-config-16 --version || true)"
fi

if [[ "${current_llvm_version}" != "16.0.6" ]]; then
  temp_dir="$(mktemp -d)"
  trap 'rm -rf "${temp_dir}"' EXIT

  wget -q -O "${temp_dir}/llvm.sh" https://apt.llvm.org/llvm.sh
  chmod +x "${temp_dir}/llvm.sh"
  sudo "${temp_dir}/llvm.sh" 16
fi

actual_llvm_version="$(llvm-config-16 --version)"
if [[ "${actual_llvm_version}" != "16.0.6" ]]; then
  echo "Expected llvm-config-16 version 16.0.6, got ${actual_llvm_version}." >&2
  echo "Please preinstall the exact LLVM 16.0.6 toolchain on the Gitee Ubuntu 20.04 host group." >&2
  exit 1
fi

sudo apt-get install -y clang-16

if [[ -x /usr/bin/clang-16 ]]; then
  sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-16 160 || true
fi

if [[ -x /usr/bin/clang++-16 ]]; then
  sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-16 160 || true
fi

echo "llvm-config-16: $(llvm-config-16 --version)"
echo "clang++: $(clang++ --version | head -n 1)"
echo "flex: $(flex --version)"
echo "bison: $(bison --version | head -n 1)"
echo "make: $(make --version | head -n 1)"
