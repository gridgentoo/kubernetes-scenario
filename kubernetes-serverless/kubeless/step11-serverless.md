Install the Serverless CLI.

`npm install serverless -g`{{execute}}

Clone the serverless-kubeless repo and check the example function

`git clone https://github.com/serverless/serverless-kubeless`{{execute}}

`cd serverless-kubeless/examples/get-python`{{execute}}

`cat serverless.yml`{{execute}}

Download dependencies

`npm install`{{execute}}

Deploy hello function

`serverless deploy`{{execute}}

The function will be deployed to Kubernetes via Kubeless.

`kubectl get function`{{execute}}

`kubeless function list`{{execute}}

`kubectl get pods`{{execute}}

Now, call the function

`serverless invoke -f hello -l`{{execute}}

or

`curl localhost:8080/api/v1/namespaces/default/services/hello:8080/proxy/ && echo`{{execute}}

Check the logs

`serverless logs -f hello`{{execute}}

Inspect Serverless

`serverless info`{{execute}}
