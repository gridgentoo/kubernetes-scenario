 The first and most essential command to run in OpenShift is oc new-app. This command is similar to Kubernetes's kubectl run, but oc new-app is way more powerful and works a little bit differently. We are going to show you how oc new-app works in detail later in this chapter.

The best way to test out the oc new-app command is to create a new project and then run it over there:
`oc new-project project1`{{execute}}

```
Now using project "project1" on server "https://127.0.0.1:8443".
You can add applications to this project with the 'new-app' command. For example, try:

    oc new-app centos/ruby-22-centos7~https://github.com/openshift/ruby-ex.git
to build a new example application in Ruby.
```

The command output tells us to run the oc new-app command. Run the command to see how it works:
`oc new-app centos/ruby-22-centos7~https://github.com/openshift/ruby-ex.git`{{execute}} 

 * An image stream will be created as "ruby-22-centos7:latest" that will track the source image
 * A source build using source code from https://github.com/openshift/ruby-ex.git will be created
 * The resulting image will be pushed to image stream "ruby-ex:latest"
 * Every time "ruby-22-centos7:latest" changes a new build will be triggered
 * This image will be deployed in deployment config "ruby-ex"
 * Port 8080/tcp will be load balanced by service "ruby-ex"
 * Other containers can access this service through the hostname "ruby-ex"
...
<output omitted>
...


Run `oc status`{{execute}}  to view your app.

There is going to be a lot of output compared to what we have seen before, but if you read through, you should be able to find out that: 

- OpenShift pulls Docker image centos/ruby-22-centos7
- OpenShift goes to GitHub and downloads the source code from it
- OpenShift applies GitHub source code to the image and stores it on the internal registry with the name ruby-ex
- ruby-ex is used to create build and deployment configurations
- The ruby-ex service is created to load balance the traffic for pods with ruby-ex in their names  
