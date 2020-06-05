**Red Hat OpenShift Container Platform** является предпочтительной средой выполнения для **Red Hat Data Grid** и основана на **Kubernetes** container-orchestration system.

**1. Вход в OpenShift**

Выполните команду **oc login** следующим образом:

`oc login -u developer -p developer`{{execute}}

Эта команда аутентифицирует вас в OpenShift со следующими учетными данными **credentials**:
* Username: **developer**
* Password: **developer**

**2. Создание проекта**

Создайте [project](https://docs.openshift.com/container-platform/3.6/architecture/core_concepts/projects_and_users.html#projects) для своего приложения RHDG следующим образом:

`oc new-project example --display-name="Simple RHDG REST App"`{{execute}}

**3. Открытие консоли OpenShift**

OpenShift предоставляет консоль, которая позволяет вам работать с приложениями из окна браузера.

1.  Выберите вкладку **OpenShift Console**, чтобы запустить консоль в браузере.
![OpenShift Console Tab](/openshift/assets/middleware/rhoar-getting-started-rhdg/openshift-console-tab.png)

2. Введите свои учетные данные **credentials**, когда будет предложено пройти аутентификацию, а затем выберите "Log in".
![Web Console Login](/openshift/assets/middleware/rhoar-getting-started-rhdg/login.png)
В консоли отображаются проекты, с которыми вы можете работать.
![Web Console Projects](/openshift/assets/middleware/rhoar-getting-started-rhdg/projects.png)

3. Выберите проект "Simple RHDG REST App", который вы создали, чтобы просмотреть все ресурсы **resources**, доступные в вашем проекте.
![Web Console Overview](/openshift/assets/middleware/rhoar-getting-started-rhdg/overview.png)

На данный момент у вашего проекта нет доступных приложений или ресурсов **resources**. Перейдите к следующему разделу и начните создавать развертывание **deployment**.
