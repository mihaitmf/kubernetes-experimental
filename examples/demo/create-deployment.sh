#!/usr/bin/env bash

# Run on master node

kubectl create -f deployment-definition.yml
kubectl get deployment -o wide
kubectl get replicaset -o wide
kubectl get pods -o wide

# To debug in case the "get all" command returns very slowly add the "-v=99" argument
#kubectl get all -v=99

# To remove run:
#kubectl delete -f deployment-definition.yml
