# Service

Examples of services:
* ClusterIP - accessible inside the cluster
* NodePort - accessible from outside of the cluster via node ip and node port
* ExternalName - not pointing to a pod but to an external service

Execute run.sh and observe the output - first nslookup is executed against ExternalName service, then pod starts calling the ClusterIP service in a loop.
Initially it reaches nginx pod unitl the service selector is changed, then it reaches httpd pod.


```
./run.sh

...

Server:         10.96.0.10
Address:        10.96.0.10:53

external-service.default.svc.cluster.local      canonical name = google.com
Name:   google.com
Address: 142.250.186.206

external-service.default.svc.cluster.local      canonical name = google.com
Name:   google.com
Address: 2a00:1450:401b:810::200e

* processing: http-service.default.svc.cluster.local
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0*   Trying 10.101.4.231:80...
* Connected to http-service.default.svc.cluster.local (10.101.4.231) port 80
> GET / HTTP/1.1
> Host: http-service.default.svc.cluster.local
> User-Agent: curl/8.2.1
> Accept: */*
>
< HTTP/1.1 200 OK
< Server: nginx/1.25.2
< Date: Mon, 04 Sep 2023 21:26:10 GMT
< Content-Type: text/html
< Content-Length: 615
< Last-Modified: Tue, 15 Aug 2023 17:03:04 GMT
< Connection: keep-alive
< ETag: "64dbafc8-267"
< Accept-Ranges: bytes
<
{ [615 bytes data]
100   615  100   615    0     0  24045      0 --:--:-- --:--:-- --:--:-- 23653
* Connection #0 to host http-service.default.svc.cluster.local left intact
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

...

* Connected to http-service.default.svc.cluster.local (10.101.4.231) port 80
> GET / HTTP/1.1
> Host: http-service.default.svc.cluster.local
> User-Agent: curl/8.2.1
> Accept: */*
>
<html><body><h1>It works!</h1></body></html>
< HTTP/1.1 200 OK
< Date: Mon, 04 Sep 2023 21:28:30 GMT
< Server: Apache/2.4.57 (Unix)
< Last-Modified: Mon, 11 Jun 2007 18:53:14 GMT
< ETag: "2d-432a5e4a73a80"
< Accept-Ranges: bytes
< Content-Length: 45
< Content-Type: text/html
<
{ [45 bytes data]
100    45  100    45    0     0   4202      0 --:--:-- --:--:-- --:--:--  4500
```

Finally, NodePort is avaliable from outside of the cluster via node IP addres and node port:

```
$ curl <node_ip>:32000
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   615  100   615    0     0   7592      0 --:--:-- --:--:-- --:--:--  7592<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

