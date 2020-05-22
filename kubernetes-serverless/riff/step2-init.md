Initialize the namespace and provide credentials for pushing images to DockerHub.

Use the riff CLI to initialize your namespace (if you plan on using a namespace other than default then substitute the name you want to use). This will create a serviceaccount and a secret with the provided credentials and install a buildtemplate. Replace the ??? with your docker username.

`export DOCKER_ID=???`{{copy}}

`riff namespace init default --dockerhub $DOCKER_ID`{{execute}}

You will be prompted to provide the password.
