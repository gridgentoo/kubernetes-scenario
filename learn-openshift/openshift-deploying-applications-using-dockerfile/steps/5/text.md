As we saw before, OpenShift can build an application from Dockerfile. Sometimes, application source code is updated and there is a need to initiate the build process again using the new source code. OpenShift supports this functionality through the oc start-build command. 

During this section, we will initiate a build process using the new source code of the application using the image stream created recently by the oc new-app command.

We built a Redis application from source code using a specific directory 3.0. 

The source code contains another Dockerfile, which uses the newer version 5.0:


`tree redis/5.0/`{{execute}}

```
redis/5.0/
├── 32bit
│   ├── docker-entrypoint.sh
│   └── Dockerfile
├── alpine
│   ├── docker-entrypoint.sh
│   └── Dockerfile
├── docker-entrypoint.sh
└── Dockerfile
```

Now, imagine that we need to update the application using new code available in another repository or another context directory in the existing repository. For our particular case, it sounds like we need to change the context directory to `5.0` instead of `4.0`.

The oc new-app command created a number of entities that control application build and deployment. The build process is under build config object control. We need to display this object to understand what to change to point to another directory in the repository:
`oc get bc`{{execute}}

```
NAME             TYPE         FROM     LATEST
redis            Docker       Git      1
```

`oc get bc redis -o yaml`{{execute}}