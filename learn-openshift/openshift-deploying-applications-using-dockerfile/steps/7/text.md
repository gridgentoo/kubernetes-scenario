Now we can check the version of our application:
`oc rsh <redis-pod-name> /usr/local/bin/redis-server --version`{{copy}}

```
Redis server v=5.0.5 sha=00000000:0 malloc=jemalloc-5.1.0 bits=64 build=20ef5c20bbb09517
```

Finally, let's make sure that the application is up and running:
`oc rsh <redis-pod-name> /usr/local/bin/redis-cli ping`{{copy}}

We were able to initiate the build from the updated source code.

Clear out your lab environment.
`oc delete all --all`{{execute}}

`oc delete project dockerfile`{{execute}}
