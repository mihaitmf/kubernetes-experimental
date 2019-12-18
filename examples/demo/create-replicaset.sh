#!/usr/bin/env bash

# Run on master node

kubectl create -f replicaset-definition.yml
kubectl get replicaset -o wide
kubectl get pods -o wide

# To remove run:
#kubectl delete -f replicaset-definition.yml
