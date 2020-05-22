Just as objects in programming languages can have attributes, a resource can also have typed attributes. When you request information about a resource or list of resources these attributes can be revealed. In the previous example, the Thermometer CRD defined the attributes for the temperature metric and its units. However, they will not be listed until the [additional printer columns](https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definitions/#additional-printer-columns) are defined.

The `thermometer-with-columns-crd.yaml` includes the `additionalPrinterColumns` section.

`cat thermometer-with-columns-crd.yaml`{{execute}}

See how two new columns are defined under the `versions` group. Apply this new CRDs declaration for the thermometers.

`kubectl apply -f thermometer-with-columns-crd.yaml`{{execute}}

Now, see the new columns appear.

`kubectl get trm -A`{{execute}}

Now there is more information shown. The temperatures are blank because this is intended to be filled in by an application. Brilliant.

Next, let's explore validation.
