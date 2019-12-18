#!/usr/bin/env bash

# Run on master node

kubectl create -f deployment-definition.yml --record

kubectl get all -o wide
kubectl rollout status deployment/myapp-deployment

# Modify the replicas property in the definition file
sed -i 's/image: nginx/image: nginx:1.12/g' deployment-definition.yml
kubectl apply -f deployment-definition.yml --record

kubectl rollout status deployment/myapp-deployment
kubectl rollout history deployment/myapp-deployment
kubectl get pods -o wide
kubectl describe deployment

kubectl rollout undo deployment/myapp-deployment

kubectl rollout status deployment/myapp-deployment
kubectl rollout history deployment/myapp-deployment
kubectl get pods -o wide
