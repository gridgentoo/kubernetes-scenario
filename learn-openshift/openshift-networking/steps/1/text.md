OpenShift makes its internal SDN plugins available out-of-the-box, as well as plugins for integration with third-party SDN frameworks. The following are three built-in plugins that are available in OpenShift:

- ovs-subnet
- ovs-multitenant
- ovs-networkpolicy
The decision regarding which plugin to use is based on what level of security and control you aim to achieve. In the following subsections, we will discuss the main features and use cases for each of those plugins. 

With SDNs taking over networking, third-party vendors have also started to develop their own solutions for programmable networks. Red Hat works closely with such providers to ensure smooth integration of their products into OpenShift. The following solutions have been tested and verified by Red Hat as production-ready:


#### ovs-subnet plugin
This is the default plugin that's enabled after OpenShift has just been installed. It provides connectivity for pods across the entire cluster with no limitations whatsoever, meaning that traffic can flow freely between all pods.

In order to see for yourself what exactly the ovs-subnet plugin does (or, rather, does not do), create two projects with one pod each and try to reach one of them from the other one.

First, create a `demo-1` project:

`oc new-project demo-1`{{execute}}

Next, launch a pod by running the httpd web server using the same YAML definition, like we did in the Tracing connectivity subsection:


<pre class="file" data-filename="httpd-pod.yml" data-target="replace">
apiVersion: v1
kind: Pod
metadata:
  name: httpd
  labels:
    role: web
spec:
  containers:
  - name: httpd
    image: manageiq/httpd
    resources:
      requests:
        cpu: 400m
        memory: 128Mi
</pre>


`oc create -f httpd-pod.yml`{{execute}}


Let's find out the IP address assigned to our pod:
`oc describe po/httpd | grep IP:`{{execute}}

```
IP: 10.129.0.22
```

**Note:** Please wait for the few seconds to get Pod's IP.