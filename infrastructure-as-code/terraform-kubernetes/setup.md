
# Конфигурирование проекта **Terraform**

Во-первых, давайте удостоверимся, что наша **Terraform command line** работает.

Давайте быстро проверим версию CLI с помощью: 

`terraform version`{{execute}}.

## **Initialize**

Мы предоставили вам **scaffold** проекта **Terraform**, который на данный момент содержит только те бэкэнды, которые мы будем **utilize**.

`cd terraform`{{execute}}

## Давайте удостоверимся, что это работает

По умолчанию поставщик **Kubernetes** для **Terraform** будет использовать наш текущий **Kubecontext**.

Выполните следующую команду, чтобы получить список **namespaces** в кластере **Kubernetes**:

`kubectl get namespaces`{{execute}}


Откройте `terraform/namespaces.tf` в редакторе и добавьте следующее содержимое:

`nano namespaces.tf`{{execute}}

<pre class="file" data-filename="terraform/namespaces.tf" data-target="replace">resource "kubernetes_namespace" "test" {
  metadata {
    name = "test"
  }
}
</pre>


Теперь мы можем инициализировать **initialize** проект, выполнив:

`terraform init`{{execute}}

Теперь давайте спланируем "plan" изменения. Когда мы запускаем эту команду, **Terraform** будет сравнивать наше желаемое состояние (то есть, что **wrong** в наших **.tf files**) с фактическим состоянием в нашей среде и сообщать нам, что ему нужно сделать, чтобы синхронизировать их.

`terraform plan -out plan`{{execute}}

```
Plan: 1 to add, 0 to change, 0 to destroy.
```

> Мы передаем аргумент `-out plan`, чтобы сохранить **plan** в файл, чтобы мы могли убедиться, что когда
> **apply the plan** - применить план, он принимает только те действия **actions**, которые мы уже рассмотрели.

Команда выведет действия, которые она хочет выполнить, чтобы синхронизировать желаемое состояние **state**
с фактическим состоянием окружающей среды.

Для этого плана мы должны увидеть ровно **1 add action**.

Изучив план **plan**, давайте применим его к нашей среде **environment**:

`terraform apply plan`{{execute}}

```
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

Поздравляем! Вы сделали первое изменение инфраструктуры с помощью **Terraform**. 

Повторное выполнение команды:

`kubectl get namespaces`{{execute}} 

должно показать новое пространство имен "test" в нашем кластере **Kubernetes**.
