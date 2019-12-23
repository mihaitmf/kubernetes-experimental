#!/usr/bin/env bash

kubectl delete -f voting-app-service.yml
kubectl delete -f result-app-service.yml
kubectl delete -f redis-service.yml
kubectl delete -f postgres-service.yml

kubectl delete -f voting-app-deployment.yml
kubectl delete -f result-app-deployment.yml
kubectl delete -f worker-app-deployment.yml
kubectl delete -f redis-deployment.yml
kubectl delete -f postgres-deployment.yml
