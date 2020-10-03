The ConfigMap resource is used to separate data from a pod running an application. These kinds of resource contain arbitrary data to be injected into a pod as configuration. Injection in this context means that the pod can use it in the following ways:

#### Export its key/value pairs as environment variables
Supply its values as command-line arguments to the application
Mount it as a volume inside the pod to the location where the application expects to find its configuration file

Let's look at the process of exporting ConfigMap as an environment variable into a container. First, we have to create ConfigMap itself from a list of environment variables:


<pre class="file" data-filename="example.env" data-target="replace">
VAR_1=Hello
VAR_2=World
</pre>

`oc create cm example-config-map --from-env-file=example.env`{{execute}}


Use the following command to see what the actual resource looks like:
`oc describe configmap/example-config-map`{{execute}}