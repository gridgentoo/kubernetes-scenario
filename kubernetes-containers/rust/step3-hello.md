To start, the Hello application is very small.

`cd hello && ls -l`{{execute}}

The `main.go` holds the only Go source.

`ccat main.go`{{execute}}

That's easy enough. A Main function, a simple message and import of an API to output the message to the console. Try it out.

`go run main.go`{{execute}}

## Container

The advent of containers is this whole application can be compiled and run without using a local installation of Go. In fact the version of Go in this Katacoda instance is probably an older version than the [most recent one available at GoLang](https://golang.org/doc/devel/release.html).

You could install a new version of Go on this instance, but that means every time you want to install a different version of the toolset there is a whole install, uninstall process. That's so 2000, we are much better than that now. With containers the full versioned stack can be defined and tested. That container, tested once, can run anywhere on a container runtime engine. Works on my machine, works on your machine.

The stack infrastructure is defined in the `Dockerfile` as [infrastructure as code](https://en.wikipedia.org/wiki/Infrastructure_as_code).

`ccat Dockerfile`{{execute}}

In just a few lines it defines:

- the base operating system complete with a specific version of Go installed.
- the working directory with the application source copied into it
- the compilation instruction to create a binary
- the application launch instruction.

Given this Dockerfile, create the container image.

`docker build -t hello:0.0.1 .`{{execute}}

This image is built.

`docker images | grep hello`{{execute}}

Now, run it.

`docker run hello:0.0.1 `{{execute}}

With just a few lines of code both the application source and the Dockerfile source define the execution. With the container build and run commands the application is running. That was easy.

However, there are a few problems with the container.

- This is a simple application and is contrived compared to a real application.
- The size of the container is excessively large. Over 800MB, we can do much better.
- The whole Go ecosystem is in the container and all we want to do is to run our app. This is wasteful.

This step is an academic, brute force attempt to put a Go application in a container. While it works, never do this for your real containers.

In the next step we will look at a better container solution.
