# Configure Terraform project

First, let's make sure that our Terraform command line is working.

Let's quickly check the version of the CLI with `terraform version`{{execute}}.

## Initialize

We have provided you with a scaffold of a Terraform project, which at this point only contains the backends that we will utilize.

`cd terraform`{{execute}}

We can now initialize the project by running:

``terraform init``{{execute}}

## Let's make sure it works

By default, the Kubernetes provider for Terraform will utilize our current Kubecontext.

Run the following command to list the namespaces in the Kubernetes cluster:

`kubectl get namespaces`{{execute}}

Open `terraform/namespaces.tf` in the editor, and add the following contents:

<pre class="file" data-filename="terraform/namespaces.tf" data-target="replace">resource "kubernetes_namespace" "test" {
  metadata {
    name = "test"
  }
}
</pre>

Now, let's "plan" the changes. When we run this command, Terraform will compare our desired state (ie. what we wrong in our .tf files) to the actual state in our environment and inform us of what it needs to do to sync them up.

`terraform plan -out plan`{{execute}}

> We pass the `-out plan` argument in order to save the plan to file, so we can ensure that when we
> apply the plan, it only takes the actions we've already reviewed.

The command will output the actions it wants to take in order synchronize your desired state
with the actual state of the environment.

For this plan, we should see exactly 1 add action.

After reviewing the plan, let's apply it to our environment:

`terraform apply plan`{{execute}}

Congrats! You've now made your first infrastructure change using Terraform. Re-running the `kubectl get namespaces`{{execute}} command should show the new namespace "test" in our Kubernetes cluster.
