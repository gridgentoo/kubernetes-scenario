## Modify SetupWithManager Function

Make the final modification in `example/controllers/at_controller.go`{{open}} to the existing SetupWithManager function at the bottom of the code. These modifications will allow the controller to watch the Pods.

```go
func (r *AtReconciler) SetupWithManager(mgr ctrl.Manager) error {
  return ctrl.NewControllerManagedBy(mgr).
    For(&cnatv1alpha1.At{}).
    Owns(&cnatv1alpha1.At{}).
    Owns(&corev1.Pod{}).
    Complete(r)
}```{{copy}}

By adding the `Pod{}` line this allows the Controller to have visibility into the Pod events.

# Test

With this new code your controller, test the new functionality.

`make install`{{execute}}

`echo "Terminate the running controller."`{{execute interrupt T2}}

Start the new controller your just modified.

`make run`{{execute T2}}

View the results.

`kubectl get ats`{{execute T1}}

Notice, now the Status column has changed from `RUNNING` to `DONE`. Check the events.

`kubectl describe at at-sample`{{execute T1}}

The description is also reporting `DONE`. However, notice at the end the Events reports `<none>`. You will work these items next.
