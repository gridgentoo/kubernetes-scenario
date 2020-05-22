Before exploring the observability topic of logging, start a small application that continuously generates log events.

Run the _random-logger_ container in a Pod to start generating continuously random logging events.

`kubectl create deployment random-logger --image=chentex/random-logger`{{execute}}

Scale to three Pods.

`kubectl scale deployment/random-logger --replicas=3`{{execute}}

The Pods will start shortly.

`kubectl get pods`{{execute}}

> Thank you to _Vicente Zepeda_ for providing this beautifully simple container. The [source code is here](https://github.com/chentex/random-logger).
