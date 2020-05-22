As an example, you will take a real application and use the registry to build the container, publish it to your local registry, and run the application on Kubernetes. This example could have used a simple and fast _hello world_, but this example is a bit richer. This take longer to build, but the hope it to expose you to new types of application possibilities on Kubernetes.

We are taking a clever application from IBM that uses Tensorflow to detect whether mitosis exists in an image of breast cancer tumor cells.

> This [repository](https://github.com/IBM/MAX-Breast-Cancer-Mitosis-Detector) contains code to instantiate and deploy the mitosis detection model mentioned above. This model takes a 64 x 64 PNG image file extracted from the whole slide image as input, and outputs the predicted probability of the image containing mitosis. For more information and additional features, check out the deep-histopath repository on GitHub.
Clone this repository locally:

`git clone https://github.com/IBM/MAX-Breast-Cancer-Mitosis-Detector.git && cd MAX-Breast-Cancer-Mitosis-Detector`{{execute}}

**Build** the container image locally. There will be some warnings in red text, but you can safely ignore them. This will take about 2-3 minutes.

`docker build -t $REGISTRY/max-breast-cancer-mitosis-detector .`{{execute}}

**Push** the local image to your private registry.

`docker push $REGISTRY/max-breast-cancer-mitosis-detector`{{execute}}

Once the push is complete, verify the new container is listed in the [registry web interface](
https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/).
