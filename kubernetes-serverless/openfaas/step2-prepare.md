There are a few things to prepare before installing OpenFaaS. Namespaces and a secret.

## Namespaces ##

Create and configure two namespaces, one for the OpenFaaS core services _openfaas_ and a second for the functions _openfaas-fn_.

`kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml`{{execute}}

The created namespaces may be listed.

`kubectl get namespaces`{{execute}}

If you are curious, scan the contents of the namespace creating YAML. Labels are added to the namespaces.

`curl https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml`{{execute}}.

## OpenFaaS Access Secret ##

Generate and submit a Kubernetes secret for basic authentication for the gateway. The secret is named _basic-auth_ and OpenFaaS will use that key when it prompts you for access.

`PASSWORD=$(head -c 12 /dev/urandom | shasum | cut --delimiter=' ' --fields=1 | head -c 4)`{{execute}}

The random password is shortened to just 4 characters for these demonstration purposes. Normally `head -c 4` would be omitted.

`kubectl -n openfaas create secret generic basic-auth --from-literal=basic-auth-user=admin --from-literal=basic-auth-password=$PASSWORD`{{execute}}
