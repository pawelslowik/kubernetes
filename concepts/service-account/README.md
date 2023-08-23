# Service account

Examples of calling kubeapi configmap endpoints from pods that run with service accounts assigned to different roles:
* default service account has no access to configmap resources
* fruits service account can only access fruits configmap resources but not vegetables configmap resources
* vegetables service account can only access vegetables configmap resources but not fruits configmap resources

```
./run.sh
...
Service accounts:
NAME                         SECRETS   AGE
default                      0         113m
service-account-fruits       0         95m
service-account-vegetables   0         95m

Role bindings:
NAME                      ROLE                                  AGE
role-binding-fruits       ClusterRole/cluster-role-fruits       95m
role-binding-vegetables   ClusterRole/cluster-role-vegetables   95m
```

Pod with default service account - can't read configmaps:

```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
{
  "kind": "Status",
  "apiVersion": "v1",
  "metadata": {},
  "status": "Failure",
  "message": "configmaps \"configmap-fruits\" is forbidden: User \"system:serviceaccount:default:default\" cannot get resource \"configmaps\" in API group \"\" in the namespace \"default\"",
  "reason": "Forbidden",
  "details": {
    "name": "configmap-fruits",
    "kind": "configmaps"
  },
  "code": 403
100   393  100   393    0     0  25223      0 --:--:-- --:--:-- --:--:-- 26200
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
}{
  "kind": "Status",
  "apiVersion": "v1",
  "metadata": {},
  "status": "Failure",
  "message": "configmaps \"configmap-vegetables\" is forbidden: User \"system:serviceaccount:default:default\" cannot get resource \"configmaps\" in API group \"\" in the namespace \"default\"",
  "reason": "Forbidden",
  "details": {
    "name": "configmap-vegetables",
    "kind": "configmaps"
  },
  "code": 403
100   401  100   401    0     0  26451      0 --:--:-- --:--:-- --:--:-- 26733
}
```

Pod with fruits service account - can read configmap-fruits, can't read configmap-vegetables:

```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
{
  "kind": "ConfigMap",
  "apiVersion": "v1",
  "metadata": {
    "name": "configmap-fruits",
    "namespace": "default",
    "uid": "c73359f8-83f7-45ad-9192-a2efecb25a73",
    "resourceVersion": "2097",
    "creationTimestamp": "2023-08-23T20:24:16Z",
    "managedFields": [
      {
        "manager": "kubectl-create",
        "operation": "Update",
        "apiVersion": "v1",
        "time": "2023-08-23T20:24:16Z",
        "fieldsType": "FieldsV1",
        "fieldsV1": {
          "f:data": {
            ".": {},
            "f:favourite-fruit": {}
          }
        }
      }
    ]
  },
  "data": {
    "favourite-fruit": "apple"
  }
100   645  100   645    0     0  37092      0 --:--:-- --:--:-- --:--:-- 37941
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
}{
  "kind": "Status",
  "apiVersion": "v1",
  "metadata": {},
  "status": "Failure",
  "message": "configmaps \"configmap-vegetables\" is forbidden: User \"system:serviceaccount:default:service-account-fruits\" cannot get resource \"configmaps\" in API group \"\" in the namespace \"default\"",
  "reason": "Forbidden",
  "details": {
    "name": "configmap-vegetables",
    "kind": "configmaps"
  },
  "code": 403
100   416  100   416    0     0  31582      0 --:--:-- --:--:-- --:--:-- 32000
}
```

Pod with vegetables service account - can't read configmap-fruits, can read configmap-vegetables:

```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
{
  "kind": "Status",
  "apiVersion": "v1",
  "metadata": {},
  "status": "Failure",
  "message": "configmaps \"configmap-fruits\" is forbidden: User \"system:serviceaccount:default:service-account-vegetables\" cannot get resource \"configmaps\" in API group \"\" in the namespace \"default\"",
  "reason": "Forbidden",
  "details": {
    "name": "configmap-fruits",
    "kind": "configmaps"
  },
  "code": 403
100   412  100   412    0     0  28076      0 --:--:-- --:--:-- --:--:-- 29428
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
}{
  "kind": "ConfigMap",
  "apiVersion": "v1",
  "metadata": {
    "name": "configmap-vegetables",
    "namespace": "default",
    "uid": "d8b6246c-422d-4595-a7a9-bc79eb4c73f3",
    "resourceVersion": "2098",
    "creationTimestamp": "2023-08-23T20:24:16Z",
    "managedFields": [
      {
        "manager": "kubectl-create",
        "operation": "Update",
        "apiVersion": "v1",
        "time": "2023-08-23T20:24:16Z",
        "fieldsType": "FieldsV1",
        "fieldsV1": {
          "f:data": {
            ".": {},
            "f:favourite-vegetable": {}
          }
        }
      }
    ]
  },
  "data": {
    "favourite-vegetable": "carrot"
  }
}
```	



