### Deploy the Guestbook example
Note: This is mostly the default Guestbook example in the [Kubernetes.io docs](https://kubernetes.io/docs/tutorials/stateless-application/guestbook/), and here is the [GitHub repo](https://github.com/kubernetes/examples/blob/master/guestbook/all-in-one/guestbook-all-in-one.yaml).

I added an ingress that preserves source IPs and added ConfigMaps for the Apache2 and Mod-Status configs so that I could block the /server-status endpoint from outside the internal network (actually apache2.conf is unedited, but I may need it later).  I also added a redis.conf to set the slowlog time criteria.


`kubectl create -f /root/course/guestbook.yaml `{{execute HOST1}}

