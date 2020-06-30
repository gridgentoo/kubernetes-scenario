# Shared Volumes

In Kubernetes, you can use a shared Kubernetes Volume as a simple and efficient way to share data between containers in a Pod. For most cases, it is sufficient to use a directory on the host that is shared with all containers within a Pod. This means there will be a directory on the host mounted into containers in a single Pod. If the Pod goes down, all data in that shared volume will be lost.

Kubernetes Volumes enable data to survive container restarts, but these volumes have the same lifetime as the Pod. That means that the volume (and the data it holds) exists exactly as long as that Pod exists. If that Pod is deleted for any reason, even if an identical replacement is created, the shared Volume is also destroyed and created anew.

A standard use case for a multi-container Pod with a shared Volume is when one container writes logs or other files to the shared directory, and the other container reads from the shared directory.

Examine the file `./resources/pod-volume.yaml` in the file explorer.

The 1st container runs Nginx server. The container mounts the shared volume to the directory `/usr/share/nginx/html`.

The 2nd container uses a Debian image and mounts the shared volume to the container directory `/html`.

Every second, the 2nd container adds the current date and time into the `index.html` file, which is located in the shared volume. When the user makes an HTTP request to the Pod, the Nginx server reads this file and transfers it back to the user in response to the request.

`kubectl create -f ./resources/pod-volume.yaml`{{execute}}

Lets see our Pods:

`kubectl get pods`{{execute}}

And let's describe the Pod:

`kubectl describe pod shared-volume`{{execute}}

We can check that both containers can `see` the same file:

`kubectl exec shared-volume -c nginx -- /bin/cat /usr/share/nginx/html/index.html`{{execute}}

`kubectl exec shared-volume -c debian -- /bin/cat /html/index.html`{{execute}}

Delete the pod resources when you are done:

`kubectl delete -f ./resources/pod-volume.yaml`{{execute}}
