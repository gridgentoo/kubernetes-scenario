# Add Namespace labels

Now let's make a change to our deployed infrastructure. At Acme Inc., we want to track the owners and primary contacts for all of our namespaces. We can do this using labels on our namespace.

Let's look at the labels currently on our namespace: `kubectl get namespace test --show-labels`{{execute}}

Open `terraform/namespaces.tf` in the editor, and update the resource:

<pre class="file" data-filename="terraform/namespaces.tf" data-target="replace">resource "kubernetes_namespace" "test" {
  metadata {
    name = "test"

    labels = {
      "service.example.com/owner" = "infrastructure-team"
      "service.example.com/technical-contact" = "infrastructure.support"
      "service.example.com/business-contact" = "infrastructure.admin"
    }
  }
}
</pre>

Now, let's "plan" the changes.

`terraform plan -out plan`{{execute}}

We can see that Terraform wants to update our resource and add the labels. Let's do that:

`terraform apply plan`{{execute}}

And once again check our test namespaces's labels: `kubectl get namespace test --show-labels`{{execute}}

> If you want to check whether your infrastructure is up-to-date, you can run `terraform plan -out plan`{{execute}} at any time.
> If there are no changes, you will see "No changes. Infrastructure is up-to-date." in the output.
