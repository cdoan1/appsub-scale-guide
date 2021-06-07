resource_list=(
    "Namespace"
    "NMStateConfig"
    "AgentClusterInstall"
    "ClusterDeployment"
    "KlusterletAddonConfig"
    "ManagedCluster"
    "InfraEnv"
    "BareMetalHost"
)

for resource in ${resource_list[*]}; do
    echo $resource
    all=`oc get $resource -A --sort-by={.metadata.creationTimestamp} --no-headers -o custom-columns=NAME:.metadata.name,CREATED:.metadata.creationTimestamp | grep sno`
    # count=`oc get $resource -A --sort-by={.metadata.creationTimestamp} --no-headers -o custom-columns=NAME:.metadata.name,CREATED:.metadata.creationTimestamp | grep sno | wc -l`
    echo $all
    echo "COUNT:  `echo $all | wc -l`"
    echo "START:  `echo $all | head -n 1`"
    echo "FINISH: `echo $all | tail -n 1`"
done
