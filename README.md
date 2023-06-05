# Create Kubernetes Cluster

Notes on cluster creation with kubeadm. I eventually abandoned the work because I couldn't figure out why the cluster wasn't stable for more than half a minute. I wonder somewhat if the directions for kubeadm directed me to some directions that were actually the old Docker way even though it sounded like it was the new way with containerd, but since I think that is also maintained by the Docker team, it felt unclear and confusing. After a lot of work, I'm just going to save this repo and call it a day. I'll probably try microk8s instead. 

## Resources used

- [YouTube: "Install Kubernetes Cluster using kubeadm" by VSPARKS](https://www.youtube.com/watch?v=Ro2qeYeisZQ)
- [K8s Docs: Creating a Cluster with kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)
- [check swapfile status](https://www.cyberciti.biz/faq/linux-check-swap-usage-command/)
- [mask swapfile in systemd](https://askubuntu.com/a/984777/455326)

## SDK

- [Example: Create Pod](https://github.com/feiskyer/go-examples/blob/master/kubernetes/pod-create/pod.go)
- [client-go pod interface](https://github.com/kubernetes/client-go/blob/da281643cfad72bc8c4565b197ec23b557e30446/kubernetes/typed/core/v1/pod.go)

## Helm and Helmfile

Helm installs charts whereas helmfile uses helm to declaratively set state using the specified charts.

### Links

- [Helm Quickstart](https://helm.sh/docs/intro/quickstart/)
- Consider using SQL backend (or stick to the v3 default of secrets if that seems like too much work)
- Helm templates can use all functions in [the Sprig library](https://masterminds.github.io/sprig/) except for env and expandenv and it adds include and required.
- [Tips and Tricks](https://helm.sh/docs/howto/charts_tips_and_tricks/)

## Troubleshooting

### Stability

I'm wondering if the directions for containerd are mixed up with pointing to incorrect docker links that aren't needed for containerd. Check these links:
- [K8s doc: runtimes, containerd setup](https://kubernetes.io/docs/setup/production-environment/container-runtimes/#containerd)
- [migrating from docker to containerd](https://kubernetes.io/docs/tasks/administer-cluster/migrating-from-dockershim/change-runtime-containerd/)

[Try another pod network too.](https://www.suse.com/c/rancher_blog/comparing-kubernetes-cni-providers-flannel-calico-canal-and-weave/))