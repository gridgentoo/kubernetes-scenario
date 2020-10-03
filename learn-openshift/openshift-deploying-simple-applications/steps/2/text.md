
OpenShift allows for deploying applications directly from existing Docker images. Imagine that your development team has an in-house process of building Docker images from their applications—this way, you can deploy applications in an OpenShift environment by using these images without any modification, which greatly simplifies migration to OpenShift. It takes several steps to create all required OpenShift entities.

First, you have to create a pod, which runs a container deployed from the application's Docker image. Once the pod is up and running, you may need to create a service to have a persistent IP address and internal DNS record associated with it. The service allows your application to be accessible via a consistent address:port pair internally inside OpenShift. This may be enough for internal applications that don't require external accesses, like databases or key/value storage.

If your application has to be available from the outside, you need to expose it to make it available from an external network, like the internet. This process can be achieved by creating an OpenShift route.

In short, the process looks like this:

- Create a pod
- Create a service by exposing the pod
- Create a route by exposing the service

In this scenario, we will be working with a simple httpd Docker container to demonstrate the application deployment process. We have chosen httpd because it is simple enough and it still allows us to focus on the main goal—the demonstration of OpenShift-related tasks.

#### Creating a pod

The httpd Docker image is available on Docker Hub. You may want to confirm this by running the following command:
`docker search httpd`{{execute}}

```
INDEX NAME DESCRIPTION STARS OFFICIAL AUTOMATED
docker.io docker.io/httpd The Apache HTTP Server Project 1719 [OK]
<OMITTED>
```

According to the image documentation, it listens on TCP port 80. We cannot simply use this container, because it binds to a privileged port. The default security policy in OpenShift doesn't allow applications to bind on ports below 1024. To avoid problems, OpenShift comes with an image stream named httpd which points to an OpenShift-ready httpd image build. For example, in our version of OpenShift, the httpd image stream points to the docker.io/centos/httpd-24-centos7 Docker container. You may want to verify that by running the following command:
`oc get is -n openshift | grep httpd`{{execute}}

```
NAME DOCKER REPO TAGS UPDATED
httpd 172.30.1.1:5000/openshift/httpd latest,2.4 3 hours ago
```

`oc describe is httpd -n openshift | grep "tagged from"`{{execute}}

Each time we want to deploy a pod using an httpd image, we need to use centos/httpd-24-centos7 instead. 

The simple httpd pod can be deployed manually from its definition:

<pre class="file" data-filename="pod_httpd.yml" data-target="replace">
apiVersion: v1
kind: Pod
metadata:
  name: httpd
  labels:
    name: httpd
spec:
  containers:
    - name: httpd
      image: centos/httpd-24-centos7
      ports:
        - name: web
          containerPort: 8080
</pre>

Note
centos/httpd-24-centos7 binds on port 8080, which allows for running the container inside OpenShift without tuning its default security policy.

Once the file is created, we can create a pod by running oc create:


`oc create -f pod_httpd.yml`{{execute}}

OpenShift needs some time to download the Docker image and deploy the pod. Once everything is finished, you should be able to have the httpd pod in the Running state:
`oc get pod`{{execute}}

```
NAME READY STATUS RESTARTS AGE
httpd 1/1 Running 0 2m
```

This pod provides the same functionality as a more complex application would (default httpd web page). We may want to verify that, as shown as follows.

First, get the pod's internal IP address:
`oc describe pod httpd | grep IP:`{{execute}}

**Note:** Please wait for the few seconds to get Pod's IP.

And then use curl to query the IP from the output above:
`curl -s <pod-ip>:8080 | head -n 4`{{copy}}

```
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
 <head>
```


**Note:** This is the beginning of the default Apache welcome page.