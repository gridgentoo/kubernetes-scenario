Now that we've covered PodSpec files and how to work with Pods on a basic level, it's time to do this from scratch.

Form groups of 2-3 people, and you will put together a PodSpec file to help us configure an application. Here's what you need to do:

1. Create a PodSpec file: `touch ./resources/nginx-self.yaml`{{execute}}
2. Fill in the required configuration information to run your Pod (open the file in the editor)
3. Run the Pod and make sure it works properly

Here is what you'll need to put in your Pod (in addition to other requirements, like *apiVersion*):
1. **Name of Pod**: `nginx`
2. **Labels**: `app=nginx`
3. **Image**: `nginx:alpine`
4. **ports**: listen on port 80
5. **Environment variables**: `user=admin`, `password=root`, `host=katacoda`
6. **Resource limits**: 1 CPU core, 256 MB of RAM

Once you've created the PodSpec file, save it, and create the Pod: `kubectl apply -f ./resources/nginx-self.yaml`{{execute}}

Next, to prove it is working correctly, open up a shell and view the environment variables, and curl the welcome page from your host (http://localhost).

> *HINT: you might need to install additional software.* `apk --update --no-cache add curl`

Exit from the shell and get the logs to make sure everything is working properly.

> Bonus question: why shouldn't we be scared that we could easily install new software inside the container as root?
