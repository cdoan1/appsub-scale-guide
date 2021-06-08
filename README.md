# appsub-scale-guide

## Run 1

* create application subscription to github repo: https://github.com/cdoan1/appsub-scale-guide.git
* load 3 appsubs
* each appsub referencing 1k, 5k, 10k configmaps to be created on the local-cluster

test 1.1: delivering 1k configmap to a single ns on the hub

test 1.2: delivering 5k configmap to a single ns on the hub

test 1.3: delivering 10k configmap to a single ns on the hub

## Run 1 Results

test 1.1: 7 minutes to process 1 appsub that references 1k configmaps

test 1.2: 106 minutes to process 1 appsub that references 5k configmaps

test 1.3: (still running) 573 minutes at 9580 subscribed, multicluster-operators-application pod seeing OOMKilled


* multicluster-operators-application restarts happening throughout the test run

