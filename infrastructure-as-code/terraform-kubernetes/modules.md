Finally, let's finish our introduction by showing the power of Terraform Modules.

Modules allow you to reuse an existing infrastructure setup in your project. In this example,
we will utilize the Kubernetes Namespace module shared on GC Accelerators to configure
a Kubernetes namespace.

Open `terraform/namespaces_module.tf` in the editor.

Let's set its contents to:

<pre class="file" data-filename="terraform/namespaces_module.tf" data-target="replace">resource "kubernetes_namespace" "test_module" {
  metadata {
    name = "test-module"
  }
}

module "namespace_test_module" {
  source = "github.com/canada-ca-terraform-modules/terraform-kubernetes-namespace"

  # See https://github.com/canada-ca-terraform-modules/terraform-kubernetes-namespace#variables-values
  # for a list of value values to the module.

  name = kubernetes_namespace.test_module.id
  namespace_admins = {
    users = []
    groups = [ "cluster-administrators" ]
  }

  ci_name = "ci"
  helm_service_account = "tiller"
  dependencies = []
}
</pre>

Before we can plan our changes, we need to fetch the module. Run `terraform get`{{execute}} to fetch it.

Once that completes, we can now run `terraform plan -out plan`{{execute}} to plan our changes. Since the changes
look reasonable, let's run `terraform apply plan`{{execute}} to apply those changes to the cluster.

We can see the changes applied to our cluster:

`kubectl get namespaces`{{execute}}

`kubectl --namespace test-module get serviceaccounts,roles,rolebindings`{{execute}}

And now let's add another namespace:

<pre class="file" data-filename="terraform/namespaces-module.tf" data-target="replace">resource "kubernetes_namespace" "test_module" {
  metadata {
    name = "test-module"
  }
}

module "namespace_test_module" {
  source = "github.com/canada-ca-terraform-modules/terraform-kubernetes-namespace"

  # See https://github.com/canada-ca-terraform-modules/terraform-kubernetes-namespace#variables-values
  # for a list of value values to the module.

  name = kubernetes_namespace.test_module.id
  namespace_admins = {
    users = []
    groups = [ "cluster-administrators" ]
  }

  ci_name = "ci"
  helm_service_account = "tiller"
  dependencies = []
}

resource "kubernetes_namespace" "test_module2" {
  metadata {
    name = "test-module2"
  }
}

module "namespace_test_module2" {
  source = "github.com/canada-ca-terraform-modules/terraform-kubernetes-namespace"

  # See https://github.com/canada-ca-terraform-modules/terraform-kubernetes-namespace#variables-values
  # for a list of value values to the module.

  name = kubernetes_namespace.test_module2.id
  namespace_admins = {
    users = [ "jane.doe@example.com" ]
    groups = [ "infrastructure-admins", "infrastructure-students" ]
  }

  ci_name = "ci"
  helm_service_account = "tiller"
  dependencies = []
}
</pre>

Before we can plan our changes, we once again need to fetch the module.
Run `terraform get`{{execute}} to fetch it.

Once that completes, we can now run `terraform plan -out plan`{{execute}} to plan our changes. Since the changes
look reasonable, let's run `terraform apply plan`{{execute}} to apply those changes to the cluster.

We can see the changes applied to our cluster:

`kubectl get namespaces`{{execute}}

`kubectl --namespace test-module2 get serviceaccounts,roles,rolebindings`{{execute}}


As you can see, with Terraform Modules adding new resources following a similar
pattern is easy!
