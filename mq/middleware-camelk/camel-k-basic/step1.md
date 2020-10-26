Чтобы запустить **Camel K**, вам понадобится доступ к среде **OpenShift 4.5**. Давайте установим основы.

## Вход в кластер через панель управления Dashboard

Кликните [Console](https://console-openshift-console-[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com) tab чтобы открыть панель управления dashboard.

Затем вы сможете войти в систему с правами администратора с помощью:

* **Username:** ``admin``{{copy}}
* **Password:** ``admin``{{copy}}


## Вход в кластер через CLI

Перед созданием любых приложений залогинтесь в системе как **admin**. Это потребуется, если вы хотите войти в веб-консоль и
используй это.

Чтобы залогинется в кластер OpenShift из **_Terminal_** выполните:

``oc login -u admin -p admin``{{execute}}

Это позволит вам войти в систему, используя учетные данные **credentials**:

* **Username:** ``admin``
* **Password:** ``admin``

Используйте те же учетные данные **credentials** для входа в веб-консоль.

## Создание собственного проекта

Чтобы создать новый проект под названием ``camel-basic``, выполните команду:

``oc new-project camel-basic``{{execute}}

## Инсталлируйте **Camel K Operator**

``kamel install``{{execute}}

OLM доступен в кластере
**Camel K** установлен в пространстве имен по умолчанию через подписку **OLM subscription**
