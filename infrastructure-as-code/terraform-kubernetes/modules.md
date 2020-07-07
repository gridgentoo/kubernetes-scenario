Наконец, давайте закончим наше представление, продемонстрировав мощь **Terraform Modules**.

Модули позволяют вам повторно использовать существующую инфраструктуру в вашем проекте. В этом примере
мы будем использовать модуль **Kubernetes Namespace** для общего доступа на **GC Accelerators** для конфигурирования
пространство имен **Kubernetes**.

Откройте **`terraform/namespaces_module.tf`** в редакторе.

`nano terraform/namespaces_module.tf`{{execute}}

Давайте установим его содержимое на:

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


Прежде чем мы сможем планировать **plan** наши изменения, нам нужно получить модуль **fetch the module**.
Запустите `terraform get`{{execute}}, чтобы получить его.

Как только это завершится, мы теперь можем запустить `terraform plan -out plan`{{execute}} для планирования наших изменений. 

Поскольку изменения выглядит разумно, давайте запустим `terraform apply plan`{{execute}} чтобы применить эти изменения к кластеру.

Чтобы мы увидели изменения, примененные к нашему кластеру:

`kubectl get namespaces`{{execute}}

`kubectl --namespace test-module get serviceaccounts,roles,rolebindings`{{execute}}

А теперь давайте добавим еще одно пространство имен:

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

Прежде чем мы сможем планировать наши изменения, нам еще раз нужно получить модуль **fetch the module**.
Запустите `terraform get`{{execute}} чтобы получить его.

Как только это завершится, мы теперь можем запустить `terraform plan -out plan`{{execute}} для планирования наших изменений.
Поскольку изменения выглядит разумно, давайте запустим `terraform apply plan`{{execute}}, чтобы применить эти изменения к кластеру.

We can see the changes applied to our cluster:

`kubectl get namespaces`{{execute}}

`kubectl --namespace test-module2 get serviceaccounts,roles,rolebindings`{{execute}}

Как видите, с помощью модулей **Terraform Modules** добавляются Новые ресурсы по аналогичной схеме патренам, легко!
