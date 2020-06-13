The scenario will reference a small example Node.js application that has already been written and placed in a public source repository. The project also contains all the YAML files to define the pipeline and allow the pipeline to build the application in a container and run it on this Kubernetes cluster.

Clone the source for the sample Node.js project and inspect the code.

`git clone https://github.com/javajon/node-js-tekton`{{execute}}

Navigate into the directory.

`cd node-js-tekton`{{execute}}

Inspect some of the files.

`apt-get install tree -y -qq && tree`{{execute}}

<img align="right" src="./assets/nodejs.png" width="150">

Here is the small application code,

`cat src/app.js`{{execute}}

Here is the container definition for the app.

`cat src/Dockerfile`{{execute}}

Here is the standard Deployment and Service manifests that start the application on Kubernetes.

`cat src/deploy.yaml`{{execute}}

At this point, we could build the application into a container and deploy on Kubernetes using a series of command-line tools. However, most things deployed to Kubernetes should be infrastructure-as-code including the recipes that continuously deliver application updates as we fix and evolve our applications. This CI/CD process is often captured in source code for CI/CD pipelines. Tekton allows you to declare your pipelines in code.
