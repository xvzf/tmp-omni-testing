#!/usr/bin/env bash
cd "$(dirname "$0")"

cat <<EOF >local-path-provisioner.yaml
cluster:
  inlineManifests:
  - name: local-path-provisioner
    contents: |
$(kustomize build . | sed 's/^/      /')
EOF
