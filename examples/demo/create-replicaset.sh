#!/usr/bin/env bash

kubectl create -f replicaset-definition.yml
kubectl get replicaset

# To remove the POD run:
#kubectl delete -f replicaset-definition.yml
