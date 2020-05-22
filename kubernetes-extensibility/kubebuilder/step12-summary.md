With the controller complete, try creating an new resource and watch how the At function works. First clear the previous at resource just for clarity and to verify the controller will correctly clean up your pods.

Delete the old at resource.

`kubectl delete at at-sample`{{execute}}

Verify the resources and Pods are gone.

`kubectl get ats,pods`{{execute}}

Create another custom resource with a better schedule. Click on this file `example/at-sample-two.yaml`{{open}} to open it in the editor. Like before, add the following declaration to the opened YAML file in the editor.

```yaml
apiVersion: cnat.my.domain/v1alpha1
kind: At
metadata:
  name: at-sample-two
spec:
  schedule: "paste date string here"
  command: 'echo "Happiness is when what you think, what you say, and what you do are in harmony."'
```{{copy}}

Click on the Copy to Clipboard icon that follows the text to and paste it into the editor. For the declared schedule time  add a server time that will be 1-2 minutes from now.

`date -d "$(date --utc +%FT%TZ) + 2 min" +%FT%TZ`{{execute}}

Copy the date and paste it into the YAML file and **immediately** Submit this resource declaration to Kubernetes.

`kubectl apply -f at-sample-two.yaml`{{execute}}

The new At are now listed.

`kubectl get ats,pods`{{execute}}

Watch for the new Pod to be created by your At controller in a minute or so.

`watch kubectl get pods`{{execute}}

Once the Pod appears this means the schedule has triggered. Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Check the events in the resource.

`kubectl describe at at-sample-two`{{execute}}

If this works for you then congratulations!
