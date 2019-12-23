#!/usr/bin/env bash

kubectl create -f redis-deployment.yml
kubectl create -f redis-service.yml

kubectl create -f postgres-deployment.yml
kubectl create -f postgres-service.yml

kubectl create -f worker-app-deployment.yml

kubectl create -f result-app-deployment.yml
kubectl create -f result-app-service.yml

kubectl create -f voting-app-deployment.yml
kubectl create -f voting-app-service.yml

kubectl get all -o wide

sleep 5

kubectl get all -o wide
