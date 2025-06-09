#!/usr/bin/env bash
cd "$(dirname "$0")"

cat <<EOF >cilium.yaml
cluster:
  network:
    cni:
      name: none
  proxy:
    disabled: true
  inlineManifests:
  - name: cilium
    contents: |
$(helm template cilium . --namespace=kube-system | sed 's/^/      /')
EOF
