Now that we've covered Manifest files, its time to tackle some real applications.

Form groups of 2-3 people, and you will put together a Manifest file to help us configure an application. Here's what you need to do:

1. Create a Manifest file: `touch ./resources/nginx-self.yaml`{{execute}}
2. Fill in the required configuration information to run your Deployment
3. Run the Deployment and make sure it works properly

Here is what you'll need to put in your Pod (in addition to other requirements, like *apiVersion*):

1. Name the Deployment
2. Configure labels for the Deployment
3. Have the ReplicaSet maintain 5 Pods
4. Use the `nginx-alpine` image
5. Listen on port `80`
6. Configure environment variables `user=admin, password=root, host=katacoda`
7. Configure resource limits: `1 CPU core, 256 MB of RAM`

Once you've created the Manifest file, save it, and create the Deployment: `kubectl create -f ./resources/nginx-self.yaml`{{execute}}

Next, to prove it is working correctly, open up a shell and view the environment variables, and CURL the welcome page from your host. After that, get the logs to make sure everything is working properly. Finally, open up a shell on the Pod, and find out what processes are running inside.
