#!/usr/bin/env bash

# Run on master node
kubectl delete service nginx
kubectl get services
kubectl delete deployment nginx
kubectl get deployments
