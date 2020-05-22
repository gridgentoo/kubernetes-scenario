Up to this point, you have only queried Kubernetes for information (the R in [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)). In this step, you will add a Pod programmatically.

Currently, if you test the Pod `add` command it returns just a placeholder message.

`kubectl example pod add an-attempt`{{execute}}

and the request does not work, no new Pods.

`kubectl get pods`{{execute}}

# Code Add Pod Logic

You will be working with the file `k8s-cli/pkg/example/cmd/pod_add.go`{{open}}.

Like you did for `pod_list`, add these imports at the top of the `pod_add` file.

```go
  apiv1 "k8s.io/api/core/v1"
  metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
  "github.com/codementor/k8s-cli/pkg/example/env"
```{{copy}}

At the bottom of the file in the `run` fuctions, find the code that reads `fmt.Printf("adding a pod\n")` and replace with:

```go
  client := env.NewClientSet(&Settings)
  podsClient := client.CoreV1().Pods(apiv1.NamespaceDefault)
```{{copy}}

Right after those lines, define the Pod using the v1.Pod API.

```go
  pod := &apiv1.Pod{
    ObjectMeta: metav1.ObjectMeta{
      Name:   name,
      Labels: map[string]string{"app": "demo"},
    },
    Spec: apiv1.PodSpec{
      Containers: []apiv1.Container{
        {
          Name:  name,
          Image: p.image,
        },
      },
    },
  }
```{{copy}}

Notice the setting of `Name`, `Image` and `Labels`.

Right after those lines, pass this reference to a Pod declaration as a request to podsClient to create the Pod.

```go
  pp, err := podsClient.Create(pod)
  if err != nil {
    return err
  }

  fmt.Fprintf(p.out, "Pod %v created with rev: %v\n", pp.Name, pp.ResourceVersion)
```{{copy}}

Notice we get another object back (`pp`) from create which contains updates to the instantiated Pod.

# Test

`go run cmd/kubectl-example/main.go pod add incredible`{{execute}}

Let's check the cluster.

`kubectl get pods`{{execute}}

Incredible, the new Pod is there as instructed via your plugin!

Generate the new plugin.

`make cli-install`{{execute}}

Test the new Pod adding feature via the plugin.

`kubectl example pod add it-just-gets-better`{{execute}}

This Pods list is obtained using the REST client calls you just added.

`kubectl get pods`{{execute}}

Now you know how to programmatically administer Kubernetes via kubectl plugins. Let you creativity run wild.
