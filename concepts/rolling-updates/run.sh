#!/bin/bash

function print_version {
  echo -e "\nDeployment image:\n"
  kubectl describe deployment nginx-deployment | grep Image
  echo -e "\nPod image:\n"
  kubectl get pods -o jsonpath='{.items[*].spec.containers[*].image}'
  echo -e "\n"
}

function wait_for_pods {
  for i in {1..10}
  do
    kubectl get pods
    sleep 1
  done
}

function update_version {
  echo -e "\nUpdating deployment image to version $1\n"
  kubectl set image deployment nginx-deployment nginx=nginx:$1
  echo -e "\nWaiting for the pods...\n"
  wait_for_pods
}

kubectl apply -f deployment.yaml

sleep 5

print_version

update_version 1.24.0

print_version

update_version 1.25.0

print_version

echo -e "\nRollout history:\n"

kubectl rollout history deployment nginx-deployment

kubectl rollout history deployment nginx-deployment --revision=1

kubectl rollout history deployment nginx-deployment --revision=2

kubectl rollout history deployment nginx-deployment --revision=3

echo -e "\nUndoing deployment...\n"

kubectl rollout undo deployment nginx-deployment --to-revision=2

wait_for_pods

print_version

kubectl rollout undo deployment nginx-deployment --to-revision=1

wait_for_pods

print_version

