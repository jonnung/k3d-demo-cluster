#!/bin/bash

CURR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
[ -d "$CURR_DIR" ] || {
  echo "FATAL: no current dir (maybe running in zsh?)"
  exit 1
}

# shellcheck source=./common.sh
source "$CURR_DIR/common.sh"

section "Create a Cluster"

info_pause_exec "Create a cluster" "k3d cluster create ${K3D_CLUSTER_NAME} --config assets/k3d-config.yaml"

section "Access the Cluster"

info_pause_exec "List clusters" "k3d cluster list"

info_pause_exec "Update the default kubeconfig with the new cluster details (Optional, included in 'k3d cluster create' by default)" "k3d kubeconfig merge ${K3D_CLUSTER_NAME} --kubeconfig-merge-default --kubeconfig-switch-context"

info_pause_exec "Use kubectl to checkout the nodes" "kubectl get nodes"

# for Demo Application
# section "Use the Cluster"
# info_pause_exec "Build the sample-app" "docker build sample/ -f sample/Dockerfile -t sample-app:local"
# info_pause_exec "Load the sample-app image into the cluster" "k3d image import -c demo sample-app:local"
# info_pause_exec "Create a new 'demo' namespace" "kubectl create namespace demo"
# info_pause_exec "Switch to the new 'demo' namespace" "kubens demo"
# info_pause_exec "Deploy the sample app with helm" "helm upgrade --install sample-app sample/conf/charts/sample-app --namespace demo --set app.image=sample-app:local"
# info_pause_exec 'Access the sample app frontend via ingress (this uses Chromium): You can change some things in the code while having the window open and see everything hot reload, when you refresh the site!' "chromium --new-window http://sample.k3d.localhost:8080 &>/dev/null &"
