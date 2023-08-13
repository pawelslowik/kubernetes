# Rolling updates
Example of performing a rolling update. Script run.sh creates a deployment with nginx instances, then updates image version and finally restores previous version.
Observe the script output to see how pods are gradually terminated and created on version change, e.g.:
```
./run.sh
deployment.apps/nginx-deployment created

Deployment image:

    Image:        nginx:1.23.0

Pod image:

nginx:1.23.0 nginx:1.23.0


Updating deployment image to version 1.24.0

deployment.apps/nginx-deployment image updated

Waiting for the pods...

NAME                                READY   STATUS              RESTARTS   AGE
nginx-deployment-6c9f456cb4-46dxg   1/1     Running             0          5s
nginx-deployment-6c9f456cb4-shpms   1/1     Running             0          5s
nginx-deployment-b55dcc56f-df2xn    0/1     ContainerCreating   0          0s
NAME                                READY   STATUS              RESTARTS   AGE
nginx-deployment-6c9f456cb4-46dxg   1/1     Running             0          6s
nginx-deployment-6c9f456cb4-shpms   1/1     Terminating         0          6s
nginx-deployment-b55dcc56f-df2xn    1/1     Running             0          1s
nginx-deployment-b55dcc56f-zsws5    0/1     ContainerCreating   0          0s
NAME                                READY   STATUS              RESTARTS   AGE
nginx-deployment-6c9f456cb4-46dxg   1/1     Running             0          7s
nginx-deployment-6c9f456cb4-shpms   1/1     Terminating         0          7s
nginx-deployment-b55dcc56f-df2xn    1/1     Running             0          2s
nginx-deployment-b55dcc56f-zsws5    0/1     ContainerCreating   0          1s
NAME                                READY   STATUS        RESTARTS   AGE
nginx-deployment-6c9f456cb4-46dxg   1/1     Terminating   0          8s
nginx-deployment-b55dcc56f-df2xn    1/1     Running       0          3s
nginx-deployment-b55dcc56f-zsws5    1/1     Running       0          2s
NAME                                READY   STATUS        RESTARTS   AGE
nginx-deployment-6c9f456cb4-46dxg   1/1     Terminating   0          9s
nginx-deployment-b55dcc56f-df2xn    1/1     Running       0          4s
nginx-deployment-b55dcc56f-zsws5    1/1     Running       0          3s
NAME                               READY   STATUS    RESTARTS   AGE
nginx-deployment-b55dcc56f-df2xn   1/1     Running   0          6s
nginx-deployment-b55dcc56f-zsws5   1/1     Running   0          5s
NAME                               READY   STATUS    RESTARTS   AGE
nginx-deployment-b55dcc56f-df2xn   1/1     Running   0          7s
nginx-deployment-b55dcc56f-zsws5   1/1     Running   0          6s
NAME                               READY   STATUS    RESTARTS   AGE
nginx-deployment-b55dcc56f-df2xn   1/1     Running   0          8s
nginx-deployment-b55dcc56f-zsws5   1/1     Running   0          7s
NAME                               READY   STATUS    RESTARTS   AGE
nginx-deployment-b55dcc56f-df2xn   1/1     Running   0          9s
nginx-deployment-b55dcc56f-zsws5   1/1     Running   0          8s
NAME                               READY   STATUS    RESTARTS   AGE
nginx-deployment-b55dcc56f-df2xn   1/1     Running   0          10s
nginx-deployment-b55dcc56f-zsws5   1/1     Running   0          9s

Deployment image:

    Image:        nginx:1.24.0

Pod image:

nginx:1.24.0 nginx:1.24.0

```
