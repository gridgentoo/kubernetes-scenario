### Pазверните пример Guestbook
Note: В основном это пример Guestbook в [Kubernetes.io docs](https://kubernetes.io/docs/tutorials/stateless-application/guestbook/), и вот [GitHub repo](https://github.com/kubernetes/examples/blob/master/guestbook/all-in-one/guestbook-all-in-one.yaml).

Я добавил ingress, который сохраняет исходные IP-адреса, и добавил ConfigMaps для конфигураций Apache2 и Mod-Status configs, чтобы можно было блокировать конечную точку  /server-status endpoint внутренней сети  internal network (на самом деле apache2.conf не редактируется, но может понадобиться позже) 
Я также добавил redis.conf.

`kubectl create -f /root/course/guestbook.yaml `{{execute HOST1}}

