OpenFaaS is now ready to do some work.

## Store Functions ##

A variety of pre-built functions are available in the OpenFaaS store. The [Function Store](https://github.com/openfaas/store) is a curated index of OpenFaaS functions which have been tested by the community and chosen for their experience. List the functions in the store.

`faas-cli store list`{{execute}}

Deploy the Cows function and invoke it a few times.

`faas-cli store deploy "ASCII Cows"`{{execute}}

`echo 10 | faas-cli invoke cows`{{execute}}

We hope this is an utterly mooving experience for you. If not, ruminate on the next step.

## Loading a Library ##
You can register a bundle of pre-built functions by submitting a single YAML file. See how these pre-defined functions are declared.

`curl https://raw.githubusercontent.com/openfaas/faas/master/stack.yml`{{execute}}

Submit this declaration to OpenFaaS and the functions will be available.

`faas-cli deploy -f https://raw.githubusercontent.com/openfaas/faas/master/stack.yml`{{execute}}

View the functions that were just submitted.

`faas-cli list --verbose`{{execute}}

You can also ask Kubernetes to list the same functions.

`kubectl get services,pods --namespace openfaas-fn`{{execute}}

One of the functions is _Markdown_. Here are two ways to invoke the function.

`echo Hi | faas-cli invoke markdown`{{execute}}

The first time this is invoked it takes a few moments for the Deployment to initialize, but once invoke the subsequent calls are fast.

`uname -a | faas-cli invoke markdown`{{execute}}

Notice how OpenFaaS tracks how many times the markdown function was invoked in the _Invocations_ column.

`faas-cli list --verbose`{{execute}}

The _Replicas_ column relates to performance and scaling that will be explored in an upcoming step.

## Kubernetes Resources ##

In Kubernetes notice, all these functions are now represented by deployments in the openfaas-fn namespace.

`kubectl get deployments --namespace openfaas-fn`{{execute}}

Additionally, they all have services load balancing for the function pods.

`kubectl get service --namespace openfaas-fn`{{execute}}
