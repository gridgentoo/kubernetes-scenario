There is a proxy command that will allow you to access the cluster via localhost. This proxy will run in the background.

`kubectl proxy 8001&`{{execute}}

Hit enter to ensure you get the shell prompt back. With this proxy, you can access the Kubernetes API locally at the specified port.

`curl localhost:8001`{{execute}}

These commands operate on the same API  as the kubectl command did in the previous step.

`curl -s localhost:8001/api/v1/namespaces/default | jq .`{{execute}}

It's not necessary for this example, but if you want to stop the proxy use the command `fg` to move the proxy to the  foregound and then exit the proxy with ```clear```{{execute interrupt}} <kbd>Ctrl</kbd>+<kbd>C</kbd>.
