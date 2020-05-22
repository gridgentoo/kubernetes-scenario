The last two examples showed simple, socially awkward applications that say hello and talk about the weather. Nowadays most microservices stand up on port port and serve up JSON responses to REST calls. Instead of REST, some developers may use gRPC or GraphQL, but that's a separate topic and Katacoda scenario. For this example we use a common Go framework for handling REST events. The application allows to you maintain a list of ideas or notes. It's simple to just to show how to implementing the CRUD (Create, Read, Update, Delete) actions for a list of items. Take a look at the application source.

`cd ~/go-examples/restafarian-gin && ls -l`{{execute}}

Notice there are three *.go files. The `model` holds the data structure for the list of items and the functions to manipulate the model. The `routes` call the functions that map the REST requests to the model functions to manipulate the items list. You might also call it the controller. Lastly, `main` is the entry point to the service that serves on a port. To start, take a look at main.

`ccat main.go`{{execute}}

<img align="right" src="./assets/gin.png" width="200">

This application uses a 3rd party Go library called [**Gin**](https://github.com/gin-gonic/gin). Gin is a HTTP framework for matching REST requests to functions. There are a few other popular Go based [HTTP Web frameworks](https://github.com/avelino/awesome-go#web-frameworks), but this Gin project has a significant amount of GitHub stars due to its performance and simplicity. Not a bad choice, and forgive me if it's not the one you prefer.

The main has 5 calls out to functions in the router code.

`ccat routes.go`{{execute}}

The router maps these REST contexts to the model functions.

`ccat model.go`{{execute}}

Nothing here is more than 100 lines of code and hopefully it's clean enough for you to understand the gist of what is coded. This example does not include an datastore, as it's out of the scope of this scenario. Instead the _datastore_ is just an in memory array of _Ideas_. Each Idea is a Go structure with two elements, a topic and idea text. The application simply lists, creates, delete and updated these ideas.

Before we get into containers, let's run the application.

`go run *.go`{{execute}}

With the application serving on a port, you can exercise the REST calls. The calls will be invoked in a separate terminal.

List the ideas.

`curl http://localhost:8080/ideas/v1/ | jq .`{{execute T2}}

The model starts with one idea. Add some new ideas.

`curl --data "topic=Pomodoro Technique&idea=Install+timer+app" http://localhost:8080/ideas/v1/ | jq .`{{execute T2}}

`curl --data "topic=Learning&idea=Explore+some+scenarios" http://localhost:8080/ideas/v1/ | jq .`{{execute T2}}

`curl http://localhost:8080/ideas/v1/ | jq .`{{execute T2}}

Edit one of the ideas.

`curl --data "topic=Learning&idea=Explore+more+Kubernetes+with+Katacodas" -X PATCH http://localhost:8080/ideas/v1/3 | jq .`{{execute T2}}

And verify the change

`curl http://localhost:8080/ideas/v1/3 | jq .`{{execute T2}}

Now that you installed the Pomodoro time app, you can delete the idea.

`curl -X "DELETE" http://localhost:8080/ideas/v1/2 | jq .`{{execute T2}}

So you see the microservice application works and is ready for containerization. Stop the server by returning to the first Terminal tab and use this ```clear```{{execute interrupt T1}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

## Container

This application is placed into a container just as we did with the previous example with the _Basic_ application using a multi-stage Dockerfile.

`docker build -t restafarian-gin:0.0.1 .`{{execute T1}}

The container is built and slightly larger than the _Basic_ application, but still significantly smaller than the _Hello_ application.

`docker images | grep restafarian`{{execute T1}}

Run the application from the container.

`docker run --name restafarian-gin restafarian-gin:0.0.1`{{execute T1}}

Obtain the IP of the running container to be used in the curl commands.

`SERVICE_IP=$(docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' restafarian-gin)`{{execute T2}}

Like before, you can send the REST commands.

`curl http://$SERVICE_IP:8080/ideas/v1/ | jq .`{{execute T2}}

`curl --data "topic=Learning&idea=What+is+Union+of+Concerned+Scientists‎?" http://$SERVICE_IP:8080/ideas/v1/ | jq .`{{execute T2}}

`curl http://$SERVICE_IP:8080/ideas/v1/ | jq .`{{execute T2}}

Stop the server by returning to the first Terminal tab and use this ```clear```{{execute interrupt T1}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.
