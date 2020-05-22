> Stern allows you to tail multiple pods on Kubernetes and multiple containers within the Pod. Each result is color coded for quicker debugging.

Download and install Stern.

`wget https://github.com/wercker/stern/releases/download/1.11.0/stern_linux_amd64`{{execute}}

`mv stern_linux_amd64 /usr/local/bin/stern && chmod +x /usr/local/bin/stern`{{execute}}

Verify Stern is working.

`stern --version`{{execute}}

Observer the random-logger using Stern.

`stern random-logger --tail=1`{{execute}}

The color coding is a helpful improvement to see the distinction events from the three Pods. Stern defaults to streaming the logs to stdout. Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

## Other Log Tailers

There are other open-source projects similar to Stern.

[Kubetail](https://github.com/johanhaleby/kubetail)
> Bash script that enables you to aggregate (tail/follow) logs from multiple Pods into one stream. This is the same as running "kubectl logs -f " but for multiple Pods.

[Kail](https://github.com/boz/kail)
> Streams logs from all containers of all matched Pods. Match Pods by Service, ReplicaSet, Deployments, and others. Adjusts to a changing cluster - Pods are added and removed from logging as they fall in or out of the selection.

[K8stail](https://github.com/dtan4/k8stail)
> As you know, kubectl logs can stream only _one_ Pod at the same time. k8stail enables you to watch log streams of _all_ Pods in the specified namespace or labels in real time, like tail -f.
