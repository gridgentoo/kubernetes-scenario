Run the create command to create a new API (group/version) as cnat/v1alpha1 and the new Kind (CRD) _At_ associated with the API.

```bash
kubebuilder create api \
 --group cnat \
 --version v1alpha1 \
 --controller \
 --resource \
 --kind At
 ```{{execute}}

Familiarize yourself with the generated files.

- `example/main.go`{{open}}
- `example/api/v1alpha1/at_types.go`{{open}}
- `example/controllers/at_controller.go`{{open}}

In the following steps you will be adding code to these files to implement your controller details.
