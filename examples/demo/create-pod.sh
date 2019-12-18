#!/usr/bin/env bash

# Run on master node

kubectl create -f pod-definition.yml
kubectl get pods -o wide

# To remove run:
#kubectl delete -f pod-definition.yml
