#!/usr/bin/env bash
set -euo pipefail

# Dedicated launcher-visible entry point for the SGLang + Mooncake variant.
# The shared DSV4 SGLang recipe owns model, router, replay, and result logic.

if [[ "${KV_OFFLOADING:-}" != "dram" || "${KV_OFFLOAD_BACKEND:-}" != "mooncake" ]]; then
    echo "Error: this recipe requires KV_OFFLOADING=dram and KV_OFFLOAD_BACKEND=mooncake." >&2
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec bash "$SCRIPT_DIR/dsv4_fp4_b300_sglang.sh"
