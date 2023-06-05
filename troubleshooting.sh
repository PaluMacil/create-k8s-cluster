# see if API server is listening
ss -nltp | grep 6443

# get cluster information
kubectl cluster-info

# disable apparmor
sudo systemctl stop apparmor
sudo systemctl disable apparmor 
sudo systemctl restart containerd.service

# allow scheduling on master note 
kubectl taint nodes --all node-role.kubernetes.io/control-plane-

# get kubelet journal
sudo journalctl -xu kubelet.service

# besides just the master, other nodes might also need this:
sudo mv /etc/containerd/config.toml /etc/containerd/config.toml.bak
sudo systemctl restart containerd

# make sure swap isn't on!
sudo swapoff -a
# https://www.geeksforgeeks.org/how-to-permanently-disable-swap-in-linux/
sudo nano  /etc/fstab
# remove swap entries