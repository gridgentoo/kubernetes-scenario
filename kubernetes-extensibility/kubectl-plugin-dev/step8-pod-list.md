Currently, if you test the Pod list command it returns just a placeholder message.

`kubectl example pod list`{{execute}}

 We want it to instead return a list of Pods. This step will add some code that enumerates the Pods. The Pods will be in a list of [structure object](https://www.golangprograms.com/go-language/struct.html) references.

Click on this file to open it in the editor `k8s-cli/pkg/example/cmd/pod_list.go`{{open}}

## Add Imports

Add the following imports at the top of the `pod_list.go`.

```go
  apiv1 "k8s.io/api/core/v1"
  metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
  "github.com/codementor/k8s-cli/pkg/example/env"
```{{copy}}

> For all of these coding instructions you can either type in the code (best way to learn) or click on the `Copy to Clipboard` icon button right after the code snippet. The code will be copied to your clipboard then you can paste it into the source files on the right.

## Run Functions

In the `run` functions, near line 67, replace the placeholder message `fmt.Printf("add pod list code using direct object references\n")` with the following:

```go
  // Acquire a kube client and a pods client
  client := env.NewClientSet(&Settings)
  podsClient := client.CoreV1().Pods(apiv1.NamespaceDefault)

  // Query pod clients for a list of pods
  list, err := podsClient.List(metav1.ListOptions{})
  if err != nil {
    return err
  }
```{{copy}}

The return list is an object that has type information AND contains a list of the objects we are interested in. This is a common pattern in Kubernetes object access. Next, append this additional code that checks to see if there are any objects and prints a line for each Pod found.

```go
  if len(list.Items) == 0 {
    fmt.Printf("No Pods discovered.\n")
    return nil
  }
  
  for _, item := range list.Items {
    fmt.Fprintf(p.out, "Pod %v in Namespace: %v\n", item.Name, item.Namespace)
  }
```{{copy}}

## Test

Test your new implementation by requesting a list of pods.

`go run cmd/kubectl-example/main.go pod list`{{execute}}

The empty list logic worked. Add 3 Pods.

```
kubectl create deployment nginx --image=nginx
kubectl scale deployment nginx --replicas=3
```{{execute}}

View your Pods list again.

`go run cmd/kubectl-example/main.go pod list`{{execute}}

Try this new list feature via the plugin.

`make cli-install`{{execute}}

`kubectl example pod list`{{execute}}
