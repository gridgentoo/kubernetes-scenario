This scenario has been tested with this version of Istio:

`export ISTIO_VERSION=1.7.0`{{execute}}

As new versions arrive, this scenario will be upgraded. This `ISTIO_VERSION` will be referenced by the installer.

## Istio operator

The Kubernetes Operator pattern is vital for multi-component solutions that are installed on Kubernetes. Often these Operators are installed with the Helm package manager for Kubernetes. While the Istio operator is installed using Helm, the Istio install isolates you from that dependency. This scenario follows the recommendations (since version 1.6) for installing the Istio operator using its installer.

Download the Istio package:

`curl -L https://istio.io/downloadIstio | sh -`{{execute}}

Install the Istio client, command-line tool:

`export PATH="$PATH:/root/istio-${ISTIO_VERSION}/bin"`{{execute}}

Verify the version of the command-line tool:

`istioctl version`{{execute}}

The version will appear, and the message `no running Istio pods in "istio-system"` is expected since nothing has started.

Initialize Istio on this Kubernetes cluster. This will start the operator and in turn, the operator will manage the installation and configuration of Istio for this cluster.

`istioctl install --set profile=demo`{{execute}}

There are a few [profiles to choose from](https://istio.io/latest/docs/setup/additional-setup/config-profiles/) based on the list of Istio features you want to enable. For this scenario with Bookinfo, the _Demo_ profile is ideal.

In a few moments, Istio will be available. Once complete. You can verify Istio is ready:

`kubectl get deployments,services -n istio-system`{{execute}}

The `deployment.apps/istiod` Deployment is the primary control plane component for Istio. Within _istiod_ are the key components such as the Pilot, Citidel, Gally, and more. In a recent revision of Istio, it was deemed that a single istiod process is a better design than breaking each primary component into separate Deployments and Pods.

The version command will list the versions of the client, control plane, and data plane:

`istioctl version`{{execute}}

A deeper installation check is done by downloading the existing configurations:

`istioctl manifest generate --set profile=demo > $HOME/istio-generated-manifest.yaml`{{execute}}

The profile _demo_ was chosen as the best configuration for learning in this scenario. There are other common configuration profiles described [here](https://istio.io/latest/docs/setup/additional-setup/config-profiles/).

Use the `verify-installation` to see if the declarations match the reality of what is running:

`istioctl verify-install -f $HOME/istio-generated-manifest.yaml`{{execute}}

If everything is healthy, you should see a listing of `checked successfully` messages for the Istio components.
