# PersistentVolume
Examples of creating a p PersistentVolume and PeristentVolumeClaim using path on the node running the pod.
Run below commands on the node, then execute run.sh, enter container's shell (kubectl exec nginx -- /bin/bash) and observe same content in mount path.

sudo mkdir /tmp/persistent-volume
sudo sh -c "echo 'Just testing' > /tmp/persistent-volume/test.txt"

