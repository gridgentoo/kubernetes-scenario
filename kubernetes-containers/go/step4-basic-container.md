The next step we look at a new application.

`cd ~/go-examples/basic && ls -l`{{execute}}

<img align="right" src="./assets/metaweather.png" width="200">

The functionality is still simple in a single file, but builds a bit more logic. The application grabs weather data from the [MetaWeather source](https://www.metaweather.com/) and with some JSON fiddling it extracts the text description of the current weather in London. I'm sure you can guess what it might often say. These two English artists reflect the same sentiment.

> These are my two drops of rain<br>
> Waiting on the window-pane... -- A. A. Milne

> And here, if I'm very much mistaken, comes the eclipse...<br>
> Rain. Uh-hmm. Well, what a shame, the rain is beginning to come down now here at Lord's...<br>
> -- Monty Python, Eclipse of the Sun

The code is in just three small functions.

`ccat main.go`{{execute}}

The application has some additional imports and dependencies, so using Go's module dependencies these have been added to the go.mod file. The key dependency is tidwall/gjson, a common API when you are writing microservices. Before we look at the container creation, let's see how the application works.

`go run *.go`{{execute}}

Delightful, there is the weather. The interesting part in this step is how to package the application in a container.

## Container

From the last step recall that although a container was made, it was a pretty heavy diaper. See how large it was.

`docker images | grep hello`{{execute}}

The reason is the container has too many extra things in the container, primarily the entire suite of Go build tools. The only thing we want in the container at runtime is the compiled application. The Dockerfile syntax has an added feature called **Multi-stage builds**. Take a look at this 3 stage Dockerfile.

`ccat Dockerfile`{{execute}}

In the first Dockerfile for Hello, it has just one `FROM` statement. This Dockerfile has 3 `FROM` statements that each represent a different stage. The first two stages are artifact gathering and building stages that feed files into the final stage. Stage 1 gathers the standard certificates for making a https REST call. Stage 2 builds the binary executable for the application. Both the certificates and the binary application are copied to the final stage. When the container is run, only the last stage is present and used. The two previous stages are thrown away, as they are no longer needed. Especially the whole Go tool suite. This will significantly reduce the size of your container, which in turn increases the startup time. Both are important factors playing nicely on Kubernetes. How much smaller? Let's find out.

`docker build -t basic:0.0.1 .`{{execute}}

It takes a bit longer to build, but it's worth it.

`docker images | grep hello; docker images | grep basic`{{execute}}

Even though Basic is a larger application than Hello, the container image is *much* smaller (8 MB vs 800 MB). Also notice that the base image of the last stage is `FROM scratch`. Since you just have a binary executable, this minimal, immutable layer is all you need.

> Keep as few things as possible in your image. If you can compile your app into a single statically linked binary, adding this binary to the scratch image allows you to get a final image that contains only your app and nothing else. By reducing the number of tools packaged in your image, you reduce what a potential attacker can do in your container. For more information, see Build the smallest image possible. --[Google Cloud docs](https://cloud.google.com/solutions/best-practices-for-building-containers#file_system_content)

**If you are going to package Go based applications in containers, use this multi-stage technique and only ship the compiled binary form of the app.**

Run the application from the container and see if the weather has changed.

`docker run basic:0.0.1`{{execute}}

No change in London? No surprise. In the next step we progress toward an example of a more realistic application in a container.
