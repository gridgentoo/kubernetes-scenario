Create a namespace, for example, to specify a country.

`kubectl create namespace sweden`{{execute}}

In you current directory there is a YAML file for a thermometer for Stockholm Sweden.

`cat stockholm-thermometer.yaml`{{execute}}

Notice the YAML has the name and namespace (as the location) and units defined. Apply this declaration.

`kubectl apply -f stockholm-thermometer.yaml`{{execute}}

Get the resource information.

`kubectl get trm -A`{{execute}}

This is as expected and consistent with the previous example. Wouldn't it be nice if the displayed output included more information regarding the resource details?
