Let's start a new nginx pod using following yaml:

<pre class="file" data-filename="nginx-pod.yml" data-target="replace">
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    role: web
spec:
  containers:
  - name: nginx
    image: nginx
</pre>

`oc create -f nginx-pod.yml`{{execute}}

`oc get po`{{execute}}

```
NAME      READY     STATUS             RESTARTS   AGE
nginx     0/1       CrashLoopBackOff   2          57s
```

What happened? Let's take a look into the pod's logs:
`oc logs -f nginx`{{execute}}

```
2019/07/18 02:44:31 [warn] 1#1: the "user" directive makes sense only if the master process runs with super-user privileges, ignored in /etc/nginx/nginx.conf:2
nginx: [warn] the "user" directive makes sense only if the master process runs with super-user privileges, ignored in /etc/nginx/nginx.conf:2
2019/07/18 02:44:31 [emerg] 1#1: mkdir() "/var/cache/nginx/client_temp" failed (13: Permission denied)
nginx: [emerg] mkdir() "/var/cache/nginx/client_temp" failed (13: Permission denied)
```

You are able to see that the container is having problems with permissions. We will fix this in the next step.