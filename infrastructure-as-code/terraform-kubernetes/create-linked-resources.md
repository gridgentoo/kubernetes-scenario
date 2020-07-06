Теперь давайте возьмем силу **Terraform** на следующий уровень, и это то уровень
где польза от этого начинает проявляться.

Мы можем ссылаться на ранее созданные **resources**, чтобы создать дополнительные
Ресурсы. 

На ресурсы можно ссылаться в следующем формате:

**`$resource_type.$resource_name.$value`**

Поэтому для нашего **namespace** мы можем использовать `kubernetes_namespace.test.id`, чтобы получить его идентификатор в кластере.

Если мы хотим включить его в **string of other text**, **Terraform** поддерживает интерполяцию строк. 
Например,мы могли бы написать **`"key = "something.${kubernetes_namespace.test.id}"`**.

Еще раз, давайте откроем наш файл **`terraform/namespaces.tf`** в редакторе и обновим его:

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

resource "kubernetes_role" "test_namespace_reader" {
  metadata {
    name = "namespace_reader"
    namespace = kubernetes_namespace.test.id
  }

  # Allow the user to get pods (and higher level constructs)
  rule {
    api_groups = [""]
    resources = ["deployments", "statefulsets", "replicasets", "pods", "services"]
    verbs = ["get", "list", "watch"]
  }
}

resource "kubernetes_role_binding" "test_namespace_readers" {
  metadata {
    name = "namespace_readers"
    namespace = kubernetes_namespace.test.id
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind = "Role"
    name = kubernetes_role.test_namespace_reader.metadata.0.name
  }

  subject {
    api_group = "rbac.authorization.k8s.io"
    kind = "User"
    name = "john.doe@example.com"
  }
}
</pre>


Теперь мы можем запустить `terraform plan -out plan`{{execute}} для планирования наших изменений. 

Поскольку изменения выглядит разумно, давайте запустим `terraform plan -out plan`{{execute}}, чтобы применить эти изменения к кластеру.

> Использование **linked resources** позволяет **Terraform** выявлять зависимости,
> чтобы обеспечить предварительное создание **dependent resources**.
