#!/bin/bash

CURR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
[ -d "$CURR_DIR" ] || {
  echo "FATAL: no current dir (maybe running in zsh?)"
  exit 1
}

# shellcheck source=./common.sh
source "$CURR_DIR/common.sh"

section "Stop Cluster"

info_pause_exec "Stop the cluster" "k3d cluster stop ${K3D_CLUSTER_NAME}"

section "Delete Cluster"

info_pause_exec "Delete the Cluster" "k3d cluster delete ${K3D_CLUSTER_NAME}"
