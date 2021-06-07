#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

#network_type="OpenShiftSDN"
network_type="OVNKubernetes"

generate_manifest_yamls() {
  
  local yaml_dir="1k"
  mkdir -p "$yaml_dir/scale$1"
  local cluster_name="scale$1"

  echo "====== Generating manifests for $cluster_name  ======"
  sed -e s/\{\{NAMESPACE\}\}/"$cluster_name"/g \
    templates/cm.template.yaml >"$yaml_dir"/scale$1/100-cm.yaml

}

for i in {1..1000}
do
  echo "$i"
  generate_manifest_yamls $i
done