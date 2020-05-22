Try the following to reveal all the API resources.

`kubectl get --raw /`{{execute}}

In this list is namespaces, so request the namespaces.

`kubectl get --raw /api/v1/namespaces`{{execute}}

Once of the namespaces is called `default`, so request details on the default namespace.

`kubectl get --raw /api/v1/namespaces/default`{{execute}}

There is a common Linux tool called `jq`. jq is like sed for JSON data. Using `jq` can make the JSON output from `kubectl` much easier to read with syntax highlighting.

`kubectl get --raw /api/v1/namespaces/default | jq .`{{execute}}

There is also a Python json.tool.

`kubectl get -v=9 --raw /api/v1/namespaces/default | python -m json.tool`{{execute}}

Notice in the last command we added a [verbosity request](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-output-verbosity-and-debugging) `-v=9`. With it set to level 9 (highest) we get a bit more insight into how the `kubectl` command is obtaining the returned information.
