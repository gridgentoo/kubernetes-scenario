
Now, we will create our own simple template. Create a new template definition with the following contents:

<pre class="file" data-filename="example-template.yml" data-target="replace">
kind: Template
apiVersion: v1
metadata:
  name: example-template
labels:
  role: web
message: You chose to deploy ${WEB_SERVER}
objects:
  - kind: Pod
    apiVersion: v1
    metadata:
      name: example-pod
    spec:
      containers:
        - name: ${WEB_SERVER}
          image: ${WEB_SERVER}
  - kind: Service
    apiVersion: v1
    metadata:
      name: example-svc
    spec:
      ports:
        - port: 80
      selector:
        role: web
  - kind: Route
    apiVersion: v1
    metadata:
      name: example-route
    spec:
      to:
        kind: Service
        name: example-svc
parameters:
  - name: WEB_SERVER
    displayName: Web Server
    description: Web server image to use
    value: nginx
</pre>


Note
Though in our case the message parameter is used in quite a rudimentary way, in more complex templates, its purpose is to tell the user how to use the template—what usernames, passwords, URLs, and so on were generated.

This template can be used to create three resources:

- A pod running a web server, which you can choose by supplying the WEB_SERVER parameter. By default, it's nginx.
- A service proxying incoming traffic to the pod.
- A route for external access.

We can process that definition right away and pass the resulting list of resources to the create command, but a common strategy is to create a template from its definition first:
`oc create -f example-template.yml`{{execute}}