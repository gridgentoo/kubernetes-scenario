There are many other repositories that you can add to Helm. If your chart is in a Github account, the location can be registered to Helm so it can pull the chart from that source.

## fabric8 ##

If you search Helm for _fabric8_, nothing will be listed.

`helm search repo fabric8`{{execute}}

This is because fabric8 maintains its own chart repository. Their repository can be added to Helm.

`helm repo add fabric8 https://fabric8.io/helm`{{execute}}

With this the repo will appear in the repo list.

`helm repo list`{{execute}}

Now, their charts can be listed.

`helm search repo fabric8`{{execute}}

A specific fabric8 chart can be further inspected.

`helm inspect chart fabric8/ipaas-platform`{{execute}}

## Incubator Charts ##

There are also dozens of public incubator charts. Add the `incubator` repo.

`helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/`{{execute}}

Explore the incubating charts. Last time we checked there were 72 incubating charts, many of them deprecated as they progressed to stable. How many are there now?

`helm search repo | grep -c 'incubator/'`{{execute}}

The [source repos for the incubators are here.](https://github.com/helm/charts/tree/master/incubator)

What about creating your own chart? In the next step, let's create a chart.
