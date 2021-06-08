#!/bin/bash

datestring() {
  sdate=$(date -j -f "%Y-%m-%dT%H:%M:%SZ" $1 "+%s")
  edate=$(date -j -f "%Y-%m-%dT%H:%M:%SZ" $2 "+%s")
  delta=$(( (edate - sdate) / 60 ))
  echo "$delta"
}


# ns=scale-test-app-4
# oc get appsub scale-test-app-5-subscription-1-local -n scale-test-app-5 -o jsonpath='{.status.statuses}' | jq . | grep lastUpdate | sort | tail -n 1
# for app in scale-test-app-4-subscription-1-local

for ns in scale-test-app-4 scale-test-app-5 scale-test-app-6
do
  app=$ns-subscription-1
  appl=$ns-subscription-1-local
  _count=$(oc get appsub $appl -n $ns -o jsonpath='{.status.statuses}'  | jq . | grep lastUpdate | sort | wc -l | xargs)
  _create=$(oc get appsub $app -n $ns -o jsonpath='{.metadata.creationTimestamp}' | xargs)
  _createl=$(oc get appsub $appl -n $ns -o jsonpath='{.metadata.creationTimestamp}' | xargs)
  _start=$(oc get appsub $appl -n $ns -o jsonpath='{.status.statuses}'  | jq . | grep lastUpdate | sort | head -n 1 | sed 's/\"lastUpdateTime\"://g' | cut -d',' -f1 | xargs)
  _end=$(oc get appsub $appl -n $ns -o jsonpath='{.status.statuses}'  | jq . | grep lastUpdate | sort | tail -n 1 | sed 's/\"lastUpdateTime\"://g' | cut -d',' -f1 | xargs)
  echo "$_create $_start $_end $_count" 
  echo "appsub local subscribe time                : "$(datestring $_start $_end)
  echo "appsub local create to fully subscribe time: "$(datestring $_createl $_end)
  echo "app create to fully subscribe time         : "$(datestring $_create $_end)
done
