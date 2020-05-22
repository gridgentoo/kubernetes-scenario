Often with commands, like `Pods` you may want to add a command flag (or switch). In this step you will add a flag for filtering on Pod status when using the `pods` command.

## Add Status Flag

In the same file `k8s-cli/pkg/example/cmd/pod_list.go`{{open}}:

- Near the top of the file in the `podListCmd struct` find where it reads `// status boolean` and add the following line `status bool`{{copy}} to the struct.
- In the middle of the file in BOTH the `newPodListCmd` AND `newPodList2Cmd` functions find where it reads `// status flag` and add the following code to add a flag state setting logic for both functions.

```go
  f := cmd.Flags()
  f.BoolVarP(&pkg.status, "status", "i", true, "display status info")
```{{copy}}

## Code When Status Flag True

Next, change the previous pod listing logic the in `run` function code for the `for` loop such that when the status flag is true it will provide a different output.

```go
  for _, item := range list.Items {
    if p.status {
      fmt.Fprintf(p.out, "pod %v in namespace: %v, status: %v\n", item.Name, item.Namespace, item.Status.Phase)
    } else {
      fmt.Fprintf(p.out, "Pod %v in Namespace: %v\n", item.Name, item.Namespace)
    }
  }
```{{copy}}

# Test

Now the `pods --status=t/f` flag will provide additional output for the list.

`go run cmd/kubectl-example/main.go pod list --status=true`{{execute}}

`go run cmd/kubectl-example/main.go pod list --status=f`{{execute}}

Generate the new plugin.

`make cli-install`{{execute}}

Test the new Pod listing status flag feature via the plugin.

`kubectl example pod list --status=true`{{execute}}

`kubectl example pod list --status=t`{{execute}}

`kubectl example pod list --status=f`{{execute}}

`kubectl example pod list`{{execute}}
