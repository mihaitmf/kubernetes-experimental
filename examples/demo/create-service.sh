#!/usr/bin/env bash

# Run on master node

kubectl create -f deployment-definition.yml
kubectl get pods -o wide

kubectl create -f service-definition.yml
kubectl get services -o wide

# Try to access one of the nginx containers which are running on the worker nodes
curl 192.168.11.21:30008
# Or try directly from a browser, the nginx default page should be displayed

# To remove run:
#kubectl delete -f deployment-definition.yml
#kubectl delete -f service-definition.yml
