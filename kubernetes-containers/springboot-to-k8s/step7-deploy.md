The name of the application is `hello`, so set an environment variable to that name.

`export APP_NAME=hello`{{execute}}

Deploy the application on Kubernetes using the container image built and pushed in the previous step. The Kubernetes manifest YAML file has a $REGISTRY and $APP_NAME variable inside of it that needs to be replaced with the actual location of the private registry and application name. Use the `envsubst` command to replace the environment variables.

`cd ~ && envsubst < hello.yaml > hello-resolved.yaml`{{execute}}

Inspect the Kubernetes resource declaration for starting the `hello` application.

`cat hello-resolved.yaml`{{execute}}

With the corrected location to the private registry, deploy the application.

`kubectl apply -f hello-resolved.yaml`{{execute}}

In a moment the application will be available.

`kubectl get deployments,pods,services`{{execute}}
