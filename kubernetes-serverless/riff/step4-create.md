This step will pull the source code for a function from a GitHub repo, build a container image based on the node function invoker, and push the resulting image to your DockerHub repository.

`riff function create square \
  --git-repo https://github.com/projectriff-samples/node-square  \
  --image $DOCKER_ID/square \
  --verbose`{{execute}}

You will see the deployment for the Square function start in the default namespace.

`kubectl get deployments,pods,rs,services`{{execute}}

(TODO, this is where this demonstration will break. Create does not return with an available function. Email me jonathan.johnson@dijure.com if you can suggest a fix.)
