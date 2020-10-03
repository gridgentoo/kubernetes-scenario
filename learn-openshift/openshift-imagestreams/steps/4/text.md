Image streams can be created by importing images from external registries in the internal registry:
`oc import-image nginx --confirm`{{execute}}

You can see from the preceding output that the Nginx image was uploaded into the internal registry at HOST_IP:5000/advanced/nginx. 
As you will also notice, its name corresponds to the image reference structure we provided earlier.

Let's delete the image stream to provide a clean slate for the next exercise:
`oc delete is/nginx`{{execute}}

```
imagestream "nginx" deleted
```
