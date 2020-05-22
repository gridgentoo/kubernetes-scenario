Charts are helpful when creating your own solutions. Application charts are often a combination on 3rd party public charts as well as your own. The first step is to create your own chart.

`helm create app-chart`{{execute}}

This will create the directory _my-app-chart_ as the skeleton for your chart. All chart directories will have these standard files and directories.

`tree app-chart`{{execute}}

All of your Kubernetes resource definitions in YAML files are located in the templates directory. Take a look at the top of _deployments.yaml_.

`cat app-chart/templates/deployment.yaml | grep 'kind:' -n -B1 -A5`{{execute}}

Notice it looks like a normal deployment YAML with the `kind: Deployment` defined. However, there is new syntax sugar using double braces `{{ .. }}`. This is the templating mechanism that Helm uses to inject values into this template. Instead of hard coding in values, this templating injects values. The templating language has many features by leveraging the Go templating API.

What about defining the container image for the deployment? That is an injected value as well.

`cat app-chart/templates/deployment.yaml | grep 'image:' -n -B3 -A3`{{execute}}

Notice the `{{ .Values.image.repository }}`, this is where the container name gets injected. All of these values have defaults typically found in the values.yaml file in the chart directory.

`cat app-chart/values.yaml | grep 'repository' -n -B3 -A3`{{execute}}

Notice the templating key uses the dot ('.') notation to navigate and extract the values from the hierarchy in the values.yaml.

In this case, the Helm _create_ feature defaulted the deployed container to be the ubiquitous demonstration application _nginx_.

As is, this chart is ready to be deployed since all the defaults have been supplied. A complete set of sensible defaults is a good practice for any chart you author. A good README for your chart should also have a table to reflect these defaults, options and descriptions.

Before deploying to Kubernetes, the _dry-run_ feature will list out the resources to the console. This allows to you inspect the injection of the values into the template without committing an installation, a helpful development technique. Observe how the container image name is injected into the template.

`helm install my-app ./app-chart --dry-run --debug | grep 'image: "' -n -B3 -A3`{{execute}}

Notice the `ImagePullPolicy` is set to the default of `IfNotPreset`. Before we deploy the chart we could modify the values.yaml file and change the policy value in there, but perhaps we would like to locally modify a different policy setting first to verify it works. Use the `--set` command to override a default value. Here we change the Nginx container image ImagePullPolicy from `IfNotPreset` to `Always`.

`helm install my-app ./app-chart --dry-run --debug --set image.pullPolicy=Always | grep 'image: "' -n -B3 -A3`{{execute}}

 With the version injecting correctly, install it.

`helm install my-app ./app-chart --set image.pullPolicy=Always`{{execute}}

In a moment the app will start. Inspect its progress.

`helm list`{{execute}}

`kubectl get deployments,service`{{execute}}
