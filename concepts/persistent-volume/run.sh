#!/bin/bash

kubectl apply -f persistent-volume.yaml
kubectl apply -f persistent-volume-claim.yaml

kubectl get pv
kubectl get pvc

kubectl apply -f pod.yaml
