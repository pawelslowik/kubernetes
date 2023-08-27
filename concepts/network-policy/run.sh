kubectl create -f policy/deny-egress-policy.yaml
kubectl create -f policy/deny-ingress-policy.yaml
kubectl create -f policy/allow-ingress-policy.yaml
kubectl create -f policy/allow-egress-policy.yaml

kubectl create -f pod/nginx-no-policy-pod.yaml
kubectl create -f pod/nginx-deny-ingress-policy-pod.yaml
kubectl create -f pod/nginx-allow-ingress-policy-pod.yaml

kubectl create -f service/nginx-no-policy-service.yaml
kubectl create -f service/nginx-deny-ingress-policy-service.yaml
kubectl create -f service/nginx-allow-ingress-policy-service.yaml

sleep 5

kubectl create -f pod/alpine-no-policy-pod.yaml
kubectl create -f pod/alpine-deny-egress-policy-pod.yaml
kubectl create -f pod/alpine-allow-egress-policy-pod.yaml

sleep 5

echo -e "-------------------------------------------------------------\n"
echo -e "Calling nginx from different pod without any policy:\n"
kubectl logs alpine-no-policy-pod
echo -e "-------------------------------------------------------------\n"

echo -e "-------------------------------------------------------------"
echo -e "Calling nginx from different pod with deny-egress policy:\n"
kubectl logs alpine-deny-egress-policy-pod
echo -e "-------------------------------------------------------------\n"

echo -e "-------------------------------------------------------------\n"
echo -e "Calling nginx from different pod with allow-egress policy:\n"
kubectl logs alpine-allow-egress-policy-pod
echo -e "-------------------------------------------------------------\n"
