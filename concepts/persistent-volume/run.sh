#!/bin/bash

kubectl apply -f persistent-volume-host-path.yaml
kubectl apply -f persistent-volume-nfs.yaml

kubectl apply -f persistent-volume-claim-host-path.yaml
kubectl apply -f persistent-volume-claim-nfs.yaml

kubectl get pv
kubectl get pvc

while [ -n "$(kubectl get pvc | grep Pending)" ]
do
    echo "Waiting for claim binding..."
    sleep 1
    kubect get pvc
done

kubectl apply -f pod.yaml
sleep 5
echo "Host path:"
kubectl logs busybox -c busybox-host-path
echo "NFS:"
kubectl logs busybox -c busybox-nfs
