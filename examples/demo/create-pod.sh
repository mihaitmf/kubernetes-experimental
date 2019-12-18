#!/usr/bin/env bash

kubectl create -f pod-definition.yml
kubectl get pods

# To remove the POD run:
#kubectl delete -f pod-definition.yml
