Like any software system, Kubernetes produces many logs.

On each node, we can view the status of `kubelet` (remember? this is the daemon responsible for Pod lifecycle management) by running:

`journalctl -lu kubelet`{{execute}}

You can use the arrow keys to navigate, and press `q`{{execute}} to exit.

> Have some extra time? Access the kubelet logs on host01 and host02 through SSH.

However, we can't do this for the rest of the Kubernetes components. Why? They are running as pods and not on the system directly.

To view logs, we can use `kubectl logs <pod name>`.

`kubectl -n kube-system logs kube-apiserver-master`{{execute}}

> Want to watch the logs in realtime? Add `-f` to the command for a continous stream. Press `ctrl+c` to stop.

Try this with other pods.
