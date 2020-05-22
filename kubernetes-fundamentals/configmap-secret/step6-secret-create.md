Both ConfigMaps and Secrets are stored in etcd, but the way you submit secrets is slightly different than ConfigMaps.

## Create from CLI ##

`kubectl create secret generic db-password --from-literal=password=MyDbPassw0rd`{{execute}}

`kubectl get secret db-password`{{execute}}

`kubectl get secret db-password -o yaml`{{execute}}

Notice when the secret is returned it's not the same string that was passed in, `password: TXlEYlBhc3N3MHJk`. It _is_ the same data, just _encoded_ in 64bit form. Kubernetes stores the data assigned to a secret in 64 bit form. __Never__ confuse _encoding_ with _encryption_, as they are two very different concepts. Values encoded are not encrypted. The encoding is to allow a wider variety of values for secrets. You can easily decode the text with a simple _base64_ command to reveal the original password text.

`echo "TXlEYlBhc3N3MHJkCg==" | base64 --decode`{{execute}}

`kubectl get secrets db-password -o 'go-template={{index .data "password"}}' | base64 --decode`{{execute}}

## Create from YAML ##

A better way to define Secrets is with a resource YAML file in this form.

`kubectl create -f secret.yaml`{{execute}}

Look inside the YAML.

`cat secret.yaml`{{execute}}

When the YAML file was create the password text came from the output of this _base64_ command.

`echo MyDbPassw0rd | base64`{{execute}}

When first creating the YAML file you can skip using the _base64_ command and instead use the kubectl `--dry-run` feature which will generate the YAML file for you with the encoding.

`kubectl create secret generic db-password --from-literal=password=MyDbPassw0rd --dry-run -o yaml > my-secret.yaml`{{execute}}

`cat my-secret.yaml`{{execute}}

In this step, we see how secrets are created and submitted as resources to Kubernetes. The next step will read these secrets.
