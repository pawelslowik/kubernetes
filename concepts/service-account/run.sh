#!/bin/bash

kubectl create -f configmap-fruits.yaml
kubectl create -f configmap-vegetables.yaml

kubectl create -f service-account-fruits.yaml
kubectl create -f service-account-vegetables.yaml

kubectl create -f cluster-role-fruits.yaml
kubectl create -f cluster-role-vegetables.yaml

kubectl create -f role-binding-fruits.yaml
kubectl create -f role-binding-vegetables.yaml

kubectl create -f alpine-pod-service-account-default.yaml
kubectl create -f alpine-pod-service-account-fruits.yaml
kubectl create -f alpine-pod-service-account-vegetables.yaml

sleep 5

echo -e "\nService accounts:"
kubectl get serviceaccounts

echo -e "\nRole bindings:"
kubectl get rolebindings

echo -e "\n\nPod with default service account:"
kubectl describe pod alpine-pod-service-account-default | grep "Service Account"
kubectl logs alpine-pod-service-account-default

echo -e "\n\nPod with fruits service account:"
kubectl describe pod alpine-pod-service-account-fruits | grep "Service Account"
kubectl logs alpine-pod-service-account-fruits

echo -e "\n\nPod with vegetables service account:"
kubectl describe pod alpine-pod-service-account-vegetables | grep "Service Account"
kubectl logs alpine-pod-service-account-vegetables
