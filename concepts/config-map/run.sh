#/bin/bash

kubectl create configmap fruits --from-file=./config/fruits
kubectl create -f vegetables-config-map.yaml
kubectl create configmap user --from-file=./config/username --from-literal="email=bob@domain.com"

kubectl get configmap fruits -o yaml
kubectl get configmap vegetables -o yaml
kubectl get configmap user -o yaml

kubectl apply -f pod.yaml
sleep 5
kubectl logs busybox
