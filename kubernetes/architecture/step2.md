При первой установке **Kubernetes** вам понадобится файл **kubeconfig** для доступа к кластеру. Этот файл указывает, как подключиться к серверу **API** и какие учетные данные **credential** использовать при аутентификации.

![Kubernetes2](./assets/kubeconfig.jpg)

Обычно он хранится в **~/.kube/config**, но также может быть определен как аргумент командной строки или переменная окружения **KUBECONFIG**.

Давайте посмотрим наш файл **kubeconfig**:

`cat ~/.kube/config`{{execute}}

## Структура Kubeconfig

### `clusters`

Этот секция определяет кластер **Kubernetes**. Указывает **URL**-адрес для доступа к серверу **API** и сертификат **SSL** для валидации.

> Often in Kubernetes YAML configuration, you will find values are Base64 encoded. This allows arbitrary data to be represented in plain text.

### `users`

This sections defines authentication credentials to use with the cluster.

In the kubeconfig of the demo environment, we are authentication using a SSL certificate. Other authentication methods, depending on the cluster, include:

- Tokens
- OAuth (allows authentication agains Active Directory, GitHub, Google, etc.)

### `contexts`

The contexts section link clusters definition and user definitions together.

The `kubectl` command line tool operates on these contexts objects.

> We only have one user, cluster and context defined in this file. It is possible to define multiple of each in a given `kubeconfig` file.
