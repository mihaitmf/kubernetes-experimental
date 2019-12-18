#!/usr/bin/env bash

# Run on master node
kubectl get nodes
kubectl create deployment nginx --image=nginx
kubectl expose deploy nginx --port 80 --target-port 80 --type NodePort
kubectl get services
