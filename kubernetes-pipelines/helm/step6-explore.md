So far we only added one repo to Helm.

`helm repo list`{{execute}}

Within this repo there are many charts. The current count, as of this writing (1/2020), is 284 charts.

`echo "The number of charts is: $(helm search repo | wc -l)."`{{execute}}

The stable chart count is consistently increasing with the maturing Kubernetes ecosystem. There are a bunch of common charts that, as a Kubernetes developer, you may want to leverage.

- `helm search repo postgres`{{execute}}
- `helm search repo sonarqube`{{execute}}
- `helm search repo rabbitmq`{{execute}}
- `helm search repo kafka`{{execute}}
- `helm search repo prometheus-operator`{{execute}}
- `helm search repo tensorflow`{{execute}}
- `helm search repo stable/redis`{{execute}}

You can also search for charts on the Helm Hub by changing the above `repo` to `hub`.

Take a moment to see all the charts in Google's repo. The list is long.

`helm search repo stable | sed -E "s/(.{27}).*$/\1/"`{{execute}}

The charts in [Helm Hub](https://hub.helm.sh/) can be listed as well.

`helm search hub --max-col-width=80 | sed -E "s/(.{70}).*$/\1/"`{{execute}}

There are over 974 charts.

Most charts are typically backed with a [GitHub repo](https://github.com/helm/charts ), a readme, and a team of people that are subject matter experts in forming these opinionated charts. As an example, take a look at the [Minio chart source](https://github.com/helm/charts/tree/master/stable/minio) and scan the README to learn how this chart can be installed and configured.
