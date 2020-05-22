Before exploring observability topics, start a small application to provide something to observe.

Run 3 instances of the _random-logger_ container to start generating continuously random logging events.

`kubectl create deployment random-logger --image=chentex/random-logger`{{execute}}

Scale to 3 instances.

`kubectl scale deployment/random-logger --replicas=3`{{execute}}

The 3 pods will start shortly.

`kubectl get pods`{{execute}}

> Thank you to _Vicente Zepeda_ for providing this beautifully simple container. The [source code is here](https://github.com/chentex/random-logger).
