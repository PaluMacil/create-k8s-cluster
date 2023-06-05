# become root
sudo su -

mv /etc/containerd/config.toml /etc/containerd/config.toml.bak
systemctl restart containerd
# change the api server address to the ip of this master node (in my case, the IP for bronze)
kubeadm init --pod-network-cidr=10.10.0.0/16 --apiserver-advertise-address=192.168.1.245

# before continuing, you must copy the output, for instance, you want the kubeadm join command it outputs

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# pod network add-on (check version)
#
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
