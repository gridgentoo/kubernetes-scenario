Create a custom resource based on this new `At` CRD. Click on this file `example/at-sample.yaml`{{open}} to open it in the editor. Add the following declaration to the opened YAML file in the editor.

```yaml
apiVersion: cnat.my.domain/v1alpha1
kind: At
metadata:
  name: at-sample
spec:
  schedule: "2020-01-30T10:02:00Z"
  command: 'echo "Something from the past told me to do this now."'
```{{copy}}

You can either type in the YAML file (best way to learn) or click on the `Copy to Clipboard` icon that follows the text to and paste it into the editor. Notice in the specification section where the schedule and command is specified. Later you will apply a better scheduled time. Submit this resource declaration to Kubernetes.

`kubectl apply -f at-sample.yaml`{{execute}}

You can always come back to the file, edit the time and reapply the request.

## Add Printer Column for Phase

As a bonus feature, add a printer column for the Phase status. In the `example/api/v1alpha1/at_types.go`{{open}} file, replace the `At struct` so is has the added Kubebuilder markers (as comments) placed above the `At struct` block.

```go
// +kubebuilder:object:root=true
// +kubebuilder:subresource:status
// +kubebuilder:printcolumn:JSONPath=".spec.schedule", name=Schedule, type=string
// +kubebuilder:printcolumn:JSONPath=".status.phase", name=Phase, type=string
// At is the Schema for the ats API
type At struct {
  metav1.TypeMeta   `json:",inline"`
  metav1.ObjectMeta `json:"metadata,omitempty"`

  Spec   AtSpec   `json:"spec,omitempty"`
  Status AtStatus `json:"status,omitempty"`
}
```{{copy}}

Re-apply the CRDs to your running Kubernetes cluster.

`make install`{{execute}}

It's time to run your controller since it will serve the information for the Phase column. Run the controller.

`cd /opt/go/src/example && make run`{{execute T2}}
 
Notice it is running in a different terminal so you can return to this tab so see its activity.

Retrieve the custom resource.

`kubectl get ats`{{execute T1}}

Great, your new Operator is alive! The new `PHASE` column appears. The column is there. but the value is blank because you have a little more code to write.
