Implement the controller details by adding two support functions and modifying another. These modifications will create the Pod and checking the schedule. Open the `example/controllers/at_controller.go`{{open}} file to edit the controller implementations.

## More Imports

This step will be adding some code so replace the whole import block at the top to support the additional code.

```go
import (
  // Core GoLang contexts
  "context"
  "fmt"
  "strings"
  "time"

  // 3rd party and SIG contexts
  "github.com/go-logr/logr"
  corev1 "k8s.io/api/core/v1"
  "k8s.io/apimachinery/pkg/api/errors"
  metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
  "k8s.io/apimachinery/pkg/runtime"
  "k8s.io/apimachinery/pkg/types"
  ctrl "sigs.k8s.io/controller-runtime"
  "sigs.k8s.io/controller-runtime/pkg/client"
  "sigs.k8s.io/controller-runtime/pkg/controller/controllerutil"
  "sigs.k8s.io/controller-runtime/pkg/reconcile"

  // Local Operator contexts
  cnatv1alpha1 "example/api/v1alpha1"
)
```{{copy}}

## Add Function newPodForCR

Add the following function that will create new Pods per the resource specification.

```go
// newPodForCR returns a busybox Pod with same name/namespace declared in resource
func newPodForCR(cr *cnatv1alpha1.At) *corev1.Pod {
  labels := map[string]string {
    "app": cr.Name,
  }
  return &corev1.Pod {
    ObjectMeta: metav1.ObjectMeta {
      Name:      cr.Name + "-pod",
      Namespace: cr.Namespace,
      Labels:    labels,
    },
    Spec: corev1.PodSpec {
      Containers: []corev1.Container {{
        Name:    "busybox",
        Image:   "busybox",
        Command: strings.Split(cr.Spec.Command, " "),
      }},
      RestartPolicy: corev1.RestartPolicyOnFailure,
    },
  }
}
```{{copy}}

## Add Function timeUntilSchedule

Add the following function that calculates the scheduled time per the resource specification.

```go
// timeUntilSchedule parses the schedule string and returns the time until the schedule.
// When it is overdue, the duration is negative.
func timeUntilSchedule(schedule string) (time.Duration, error) {
  now := time.Now().UTC()
  layout := "2006-01-02T15:04:05Z"
  s, err := time.Parse(layout, schedule)
  if err != nil {
    return time.Duration(0), err
  }
  return s.Sub(now), nil
}
```{{copy}}

## Append to Reconcile Function

Add the logic for phase adjustments. In the Reconcile function find this if block.

```go
  // If no phase set, default to pending (the initial phase):
  if instance.Status.Phase == "" {
    instance.Status.Phase = cnatv1alpha1.PhasePending
  }
```

Finishing the function by inserting the following lengthy switch block just after that if block.

```go
  // Make the main case distinction: implementing
  // the state diagram PENDING -> RUNNING -> DONE
  switch instance.Status.Phase {
    case cnatv1alpha1.PhasePending:
      logger.Info("Phase: PENDING")
      // As long as we haven't executed the command yet, we need to check if it's time already to act
      logger.Info("Checking schedule", "Target", instance.Spec.Schedule)
      // Check if it's already time to execute the command with a tolerance of 2 seconds:
      d, err := timeUntilSchedule(instance.Spec.Schedule)
      if err != nil {
        logger.Error(err, "Schedule parsing failure")
        // Error reading schedule. Wait until it is fixed.
        return reconcile.Result{}, err
      }
      logger.Info("Schedule parsing done", "Result", fmt.Sprintf("diff=%v", d))
      if d > 0 {
        // Not yet time to execute command, wait until the scheduled time
        return reconcile.Result{RequeueAfter: d}, nil
      }
      logger.Info("It's time!", "Ready to execute", instance.Spec.Command)
      instance.Status.Phase = cnatv1alpha1.PhaseRunning

    case cnatv1alpha1.PhaseRunning:
      logger.Info("Phase: RUNNING")
      pod := newPodForCR(instance)
      // Set At instance as the owner and controller
      if err := controllerutil.SetControllerReference(instance, pod, r.Scheme); err != nil {
        // requeue with error
        return reconcile.Result{}, err
      }
      found := &corev1.Pod{}
      err = r.Get(context.TODO(), types.NamespacedName{Name: pod.Name, Namespace: pod.Namespace}, found)
      // Try to see if the Pod already exists and if not
      // (which we expect) then create a one-shot Pod as per spec:
      if err != nil && errors.IsNotFound(err) {
        err = r.Create(context.TODO(), pod)
        if err != nil {
          // requeue with error
          return reconcile.Result{}, err
        }
        logger.Info("Pod launched", "name", pod.Name)
      } else if err != nil {
        // requeue with error
        return reconcile.Result{}, err
      } else if found.Status.Phase == corev1.PodFailed || found.Status.Phase == corev1.PodSucceeded {
        logger.Info("Container terminated", "reason", found.Status.Reason, "message", found.Status.Message)
        instance.Status.Phase = cnatv1alpha1.PhaseDone
      } else {
        // don't requeue because it will happen automatically when the Pod status changes
        return reconcile.Result{}, nil
      }

    case cnatv1alpha1.PhaseDone:
      logger.Info("Phase: DONE")
      return reconcile.Result{}, nil

    default:
      logger.Info("NOP")
      return reconcile.Result{}, nil
  }
```{{copy}}

# Test

With this new code your controller, test the new functionality.

`make install`{{execute}}

`echo "Terminate the running controller."`{{execute interrupt T2}}

Start the new controller your just modified.

`make run`{{execute T2}}

View the results.

`kubectl get ats`{{execute T1}}

Notice, now the Status column still has changed from `PENDING` to `RUNNING`. Check the events.

`kubectl describe at at-sample`{{execute T1}}

The description is also reporting `RUNNING`. However, even though the phase status is changing it never fully gets to `DONE`. This is because the controller isn't watching Pods yet. Also, notice at the end the Events reports `<none>`. There has also been a little Pod activity, but it's not quite right.

`kubectl get pods`{{execute}}

You will work on implementing these features next.
