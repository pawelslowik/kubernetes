#!/bin/bash

kubectl create -f pod.yaml

sleep 10

echo "No security context, creating file as root:"
kubectl logs busybox-pod -c busybox-no-security-context
echo "-------------------------------------------"

echo "Read-ony file system, file creation failed:"
kubectl logs busybox-pod -c busybox-read-only-filesystem
echo "-------------------------------------------"

echo "Run as non root without specified user, container creation failed:"
kubectl describe pod busybox-pod | grep runAsNonRoot
echo "-------------------------------------------"

echo "Run as non-root user:"
kubectl logs busybox-pod -c busybox-run-as-user
echo "-------------------------------------------"

echo "Set date without capability:"
kubectl logs busybox-pod -c busybox-without-required-capability
echo "-------------------------------------------"

echo "Set date with capability (caution - this changes node date and can impact certificates validity):"
kubectl logs busybox-pod -c busybox-with-required-capability
