# Security context

Examples of using security context to set security constraints for processes running in containers:
* no security context - processes runs as root
* read-only file system - not able to create a file inside container
* require container to run as non-root without setting another user - container fails
* require container to run as non-root with specific user - container runs successfully
* run process inside container (set date) without required eapability (SYS_TIME) - process fails
* run process inside container (set date) with required capability (SYS_TIME) - process runs successfully (caution, this changes node date!)

```
./run.sh
pod/busybox-pod created
No security context, creating file as root:
uid=0(root) gid=0(root) groups=0(root),10(wheel)
-rw-r--r--    1 root     root            19 Aug 19 21:02 test.txt
-------------------------------------------
Read-ony file system, file creation failed:
touch: test.txt: Read-only file system
-------------------------------------------
Run as non root without specified user, container creation failed:
  Warning  Failed     <invalid>                      kubelet            Error: container has runAsNonRoot and image will run as root (pod: "busybox-pod_default(c36d5e58-a079-4495-93f2-06ce515f81f3)", container: busybox-run-as-non-root)
-------------------------------------------
Run as non-root user:
uid=1000 gid=2000 groups=2000
-------------------------------------------
Set date without capability:
Date before change Sat Aug 19 21:02:54 UTC 2023
date: can't set date: Operation not permitted
Sat Aug 19 21:00:00 UTC 2023
Date after change Sat Aug 19 21:02:54 UTC 2023
-------------------------------------------
Set date with capability:
Date before change Sat Aug 19 21:02:55 UTC 2023
Sat Aug 19 21:00:00 UTC 2023
Date after change Sat Aug 19 21:00:00 UTC 2023
```
