Kubeless supports a variety of languages and versions out of the box. To see the list of runtimes use this command.

`kubeless get-server-config`{{execute}}

To deploy a Python function, the Kubeless CLI tool needs some information:

- The name you will use to access the function over the Web
- The [runtime](https://kubeless.io/docs/runtimes/) to be executed to run the code (e.g. Python)
- The name of the file containing the function code
- The name of the function inside the file

`kubeless function deploy fibonacci --from-file fibonacci.py --runtime python3.6 --handler fibonacci.values`{{execute}}

With the above, here is a breakdown of this function registration request:

- kubeless function deploy _fibonacci_ tells Kubeless to register a new function named `fibonacci`. The function will be accessible over the Web using this name. This doesn’t need to be the same as the function name used inside the code (this is instead specified using the --handler option).

- --runtime python3.6 tells Kubeless to use Python 3.6 to execute the code. Other runtimes are available such as: Java, NodeJS, Ruby, PHP, Go, .NET and Ballerina. You can also supply a [custom runtime](https://kubeless.io/docs/runtimes/) as a container.

- --handler fibonacci.values tells Kubeless the name of the function to call inside the code module. You can see in the Python code above that the function is called values().

- --from-file /tmp/fibonacci.py tells Kubeless to upload and use the /tmp/fibonacci.py file as the source for the function. It is possible to pass a function in other ways.

You can list the new function with the Kubeless CLI:

`kubeless function list`{{execute}}

While the function is deploying inspect the actual Python function source code:

`cat fibonacci.py`{{execute}}

With the deploy command, Kubeless automatically created a Kubernetes deployment and service for your function. Observe that a Deployment containing your function is running and exposed as a service in the default namespace:

Execute this command until _Available_ turns from 0 to 1.

`kubectl get deployments,pods,services`{{execute}}
