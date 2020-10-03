
In this example, we will supply the Nginx web server with our custom configuration file, which will make its default virtual host listen on port 8888 instead of 80. Here's the simple configuration to achieve that:


<pre class="file" data-filename="nginx_custom_default.conf" data-target="replace">

server {
    listen       8888;
    server_name  localhost;
    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }
}
</pre>

Now, let's go ahead and create a ConfigMap from this configuration:
`oc create cm nginx --from-file nginx_custom_default.conf`{{execute}}

We can take a look at the raw resource definition of this ConfigMap:
`oc export configmap/nginx`{{execute}}

As you can see, the entire contents of the configuration file was inserted as value into the config map definition with the key `nginx_custom_default.conf`, which can be used to reference the configuration in a pod.