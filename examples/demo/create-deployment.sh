#!/usr/bin/env bash

kubectl create -f deployment-definition.yml
kubectl get deployment -o wide
kubectl get replicaset -o wide
kubectl get pods -o wide

# To remove the POD run:
#kubectl delete -f deployment-definition.yml
