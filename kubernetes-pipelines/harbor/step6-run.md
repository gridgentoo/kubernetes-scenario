Deploy the application on Kubernetes using the container image built and pushed in the previous step. The Kubernetes manifest YAML file has a $REGISTRY variable inside of it that needs to be replaced with the actual location of the private registry. Use the `envsubst` command to replace the environment variable.

`cd ~ && envsubst < max-breast-cancer-mitosis-detector.yaml > max-breast-cancer-mitosis-detector-modified.yaml`{{execute}}

With the corrected location to the private registry, deploy the application.

`kubectl apply -f max-breast-cancer-mitosis-detector-modified.yaml`{{execute}}

In a moment the application will be available.

`kubectl get deployments,pods,services`{{execute}}

Now that the application is running navigate to the application's [interactive Swagger documentation page](http://[[HOST_SUBDOMAIN]]-32500-[[KATACODA_HOST]].environments.katacoda.com/).

Obtain the service location of the application. Be sure access is via HTTP, not HTTPS.

`export APP=http://127.0.0.1:32500/`{{execute}}

You can exercise the application from the command line.

`cd ~/MAX-Breast-Cancer-Mitosis-Detector`{{execute}}

See the model prediction, in JSON form, with an image containing a known breast cancer mitosis.

`curl -F image=@samples/true.png -XPOST "${APP}model/predict"`{{execute}}

See the model prediction with an image without a known breast cancer mitosis.

`curl -F image=@samples/false.png -XPOST "${APP}model/predict"`{{execute}}

If this IBM app piques your interest you can explore the details of this application [here](https://github.com/IBM/MAX-Breast-Cancer-Mitosis-Detector). IBM governs many other [MAX applications in the same GitHub account](https://github.com/search?q=org%3AIBM+MAX&unscoped_q=MAX).

## _Early Detection Saves Lives_ ##
