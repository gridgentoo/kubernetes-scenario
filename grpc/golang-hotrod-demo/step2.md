HotROD is a demo “ride sharing” application written in Golang. This is a demo application that consists of several microservices and illustrates the use of the OpenTracing API.

## Start App

Start the app as a Docker Container with the following command:

`docker run --rm -it \
  --link jaeger -p8080-8083:8080-8083 \
  jaegertracing/example-hotrod:1.3 \
  --jaeger-agent.host-port=jaeger:6831`{{execute}}

More details on the sample application can be found at https://github.com/jaegertracing/jaeger/tree/master/examples/hotrod
