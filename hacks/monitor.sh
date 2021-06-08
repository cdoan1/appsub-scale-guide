#!/bin/bash

while [ true ];
do
  d=$(date +"%Y-%m-%dT%T")
  count=$(oc get appsub scale-test-app-5-subscription-1-local -n scale-test-app-5 -o jsonpath='{.status.statuses}' | jq . | grep lastUpdate | sort | wc -l | awk '{print $1}')
  echo "$d,$count" >> data.csv
  sleep 10
done
