#!/usr/bin/env bash

# Modify the replicas property in the definition file
sed -i 's/replicas: 3/replicas: 6/g' replicaset-definition.yml
kubectl replace -f replicaset-definition.yml

kubectl get replicaset -o wide
kubectl get pods -o wide

# Or use directly the kubectl scale command which does not modify the file, "rs" stands for resource type replicaset
kubectl scale --replicas=2 rs/myapp-replicaset

kubectl get replicaset -o wide
kubectl get pods -o wide
