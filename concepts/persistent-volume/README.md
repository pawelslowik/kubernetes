# PersistentVolume
Examples of creating a p PersistentVolume and PeristentVolumeClaim using host path and nfs attached to Azure File Share.

# Setup

1. Create premium Azure Storage Account (only premium works with NFS!) and Azure File Share. Disable secure transfer required in Azure Storage Account. Mount AFS in local file system and upload a test file.
2. Update nfs persistent volume descriptor with storage account name and file share path
2. Open NFS port 2049 on nodes. If you use Azure VMs make sure the Azure Stora Account is configured to allow acces from VNET that runs VMs, modify NSGs to allow communication via port 2049.
3. Run commands on nodes: `sudo mkdir /tmp/persistent-volume` and `sudo sh -c "echo 'Just testing' > /tmp/persistent-volume/test.txt"`
4. Execute `run.sh`, should display created Kuberneter resources as well as content of files mounted via host path and nfs:o
```
 ./run.sh
persistentvolume/pv-host-path created
persistentvolume/pv-nfs created
persistentvolumeclaim/pvc-host-path created
persistentvolumeclaim/pvc-nfs created
NAME           CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                   STORAGECLASS   REASON   AGE
pv-host-path   10Mi       RWO            Retain           Bound    default/pvc-host-path   manual                  1s
pv-nfs         1Mi        RWX            Retain           Bound    default/pvc-nfs                                 1s
NAME            STATUS   VOLUME         CAPACITY   ACCESS MODES   STORAGECLASS   AGE
pvc-host-path   Bound    pv-host-path   10Mi       RWO            manual         1s
pvc-nfs         Bound    pv-nfs         1Mi        RWX                           1s
pod/busybox created
Host path:
Just testing
NFS:
Hello from Azure File Share NFS!
```
