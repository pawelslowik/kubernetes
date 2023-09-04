#!/bin/bash

kubectl create deployment httpd --image=httpd
kubectl create deployment nginx --image=nginx

kubectl create -f http-service.yaml
kubectl create -f external-service.yaml
kubectl create -f http-node-port-service.yaml

kubectl create -f http-client-pod.yaml

sleep 5

kubectl logs http-client
