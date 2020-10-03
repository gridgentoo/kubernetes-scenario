An OpenShift template is a set of API resources that can be parameterized and processed to produce a list of objects for creation by OpenShift. A template can be processed to create any desired OpenShift objects (such as deployment configurations, build configurations, and so on). A template can also define a set of labels to apply to every object defined in the template. You can apply a template by using the CLI or the web console. For example, a template might contain two pods (an application and a database), a service, and a route. Once the template has been developed, you can reuse it.
 

#### Template syntax
Templates, like any other OpenShift resources, can be created from a raw YAML or JSON definition. An example is as follows:

<pre class="file" data-filename="mytemplate.yaml" data-target="replace">

apiVersion: v1
kind: Template 
metadata:
  name: template1
objects: 
- apiVersion: v1
  kind: Pod
  metadata:
    name: app1
  spec:
    containers:
    - env:
      - name: SHOW_DATA
        value: ${SHOW_DATA} 
      image: example/appimage
      name: app1
      ports:
      - containerPort: 8080
        protocol: TCP
parameters: 
- description: Myapp configuration data
  name: SHOW_DATA
  required: true
labels: 
  mylabel: app1
</pre>

The preceding example includes only one resource—a pod named app1. It also includes a parameter—SHOW_DATA. Parameters can be used to customize application deployment and accommodate all kinds of use cases.