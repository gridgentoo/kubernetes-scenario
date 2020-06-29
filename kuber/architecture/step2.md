When you first install Kubernetes, you will need a `kubeconfig` file to access the cluster.  This file indicates how to connect to the API server, and which credential to use when authenticating.

It is typically stored in `~/.kube/config`, but can also be defined as a command line argument or the `KUBECONFIG` environment variable.

Let's view our `kubeconfig` file:

`cat ~/.kube/config`{{execute}}

## Structure of Kubeconfig

### `clusters`

This section defines the Kubernetes cluster. It indicates the URL to access the API server and the SSL certificate for validation.

> Often in Kubernetes YAML configuration, you will find values are Base64 encoded. This allows arbitrary data to be represented in plain text.

### `users`

This sections defines authentication credentials to use with the cluster.

In the kubeconfig of the demo environment, we are authentication using a SSL certificate. Other authentication methods, depending on the cluster, include:

- Tokens
- OAuth (allows authentication agains Active Directory, GitHub, Google, etc.)

### `contexts`

The contexts section link clusters definition and user definitions together.

The `kubectl` command line tool operates on these contexts objects.

> We only have one user, cluster and context defined in this file. It is possible to define multiple of each in a given `kubeconfig` file.
