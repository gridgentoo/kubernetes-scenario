Kubernetes clusters have some form of a Domain Name System (DNS) handler. DNS is the heart of service discovery and like everything in Kubernetes, it runs in a container as it handles the lookups. There are a variety of providers for Kubernetes DNS solutions. In 2018 [CoreDNS](https://coredns.io/) became a preferred solution in the community.

In Katacoda, the version of Kubernetes you are using has _CoreDNS_ servicing the requests. The DNS service can be seen running here.

`kubectl get services,pods,deployments -l 'k8s-app=kube-dns' --namespace kube-system`{{execute}}

There are a few other DNS providers and the customization is covered in the article, [Customizing DNS Service](https://kubernetes.io/docs/tasks/administer-cluster/dns-custom-nameservers/).
