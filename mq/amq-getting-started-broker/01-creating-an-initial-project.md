Прежде чем начать, рекомендуем прочитать следующие советы. Они объясняют
немного о том, как настраивается Эксперементальная среда **environment**  и какой у вас доступ.

## Вход в кластер через Dashboard

Кликните [Console](https://console-openshift-console-[[HOST_SUBDOMAIN]]-443-[[KATACODA_HOST]].environments.katacoda.com) tab чтобы открыть dashboard.

Затем вы сможете войти в систему с правами администратора **admin permissions** с помощью:

* **Username:** ``admin``{{copy}}
* **Password:** ``admin``{{copy}}

Или как стандартный пользователь **standard user** с:

* **Username:** ``developer``{{copy}}
* **Password:** ``developer``{{copy}}

## Вход в кластер через CLI

Когда Эксперементальная площадка **OpenShift** будет создана, вы сначала войдете в систему как
администратор кластера (`oc whoami`{{execute}}) в командной строке. Это позволит вам выполнить
операции, которые обычно выполняет администратор кластера.

Перед созданием любых приложений рекомендуется войти в систему как отдельный
пользователь. Это потребуется, если вы хотите войти в **web console OpenShift** и
используй это.

Чтобы войти в кластер **OpenShift** из **_Terminal_**, выполните:

``oc login -u developer -p developer``{{execute}}

Это позволит вам войти в систему, используя учетные данные **credentials**:

* **Username:** ``developer``
* **Password:** ``developer``

Используйте те же учетные данные **credentials** для входа в **web console OpenShift**.

Для того, чтобы вы еще могли запускать команды из командной строки как **cluster
admin**, роль ``sudoer`` была включена для учетной записи разработчика ``developer``.
Чтобы выполнить команду от имени администратора кластера, используйте параметр ``--as system:admin``
к команде. Например:

``oc get projects --as system:admin``{{execute}}

## Создание собственного проекта

Чтобы создать новый проект под названием ``myproject``, выполните команду:

``oc new-project myproject``{{execute}}

Вместо этого вы можете создать проект из **web console OpenShift**. 
Если вы сделаете это, чтобы перейти к проекту из командной строки, выполните команду:

``oc project myproject``{{execute}}

## Persistent Volume Claims

**Persistent volumes** были предварительно созданы в Эксперементальной среде **environment**.
Они будут использоваться, если вы подадите заявки на постоянный том для приложения.
Размеры тома **volume size** определены как 100Gi each, но вы ограничены тем, как
много дискового пространства, которое имеет хост, на котором запущена среда **OpenShift environment**,
значительно меньше.

Чтобы просмотреть список доступных постоянных томов **persistent volumes**, вы можете запустить:

``oc get pv --as system:admin``{{execute}}


To get started, first we need to login to OpenShift.

To login to the OpenShift cluster use the following commmand in your **_Terminal_**:

``oc login -u developer -p developer [[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com --insecure-skip-tls-verify=true``{{execute}}

> You can click on the above command (and all others in this scenario) to automatically copy it into the terminal and execute it.

This will log you in using the credentials:

* **Username:** ``developer``
* **Password:** ``developer``

You should see the output:

```
Login successful.

You don't have any projects. You can try to create a new project, by running

    oc new-project <projectname>
```

For this scenario lets create a project called ``messaging`` by running the command:

``oc new-project messaging``{{execute}}

You should see output similar to:

```
Now using project "messaging" on server "https://172.17.0.41:8443".

You can add applications to this project with the 'new-app' command. For example, try:

    oc new-app centos/ruby-22-centos7~https://github.com/openshift/ruby-ex.git

to build a new example application in Ruby.
```

In the next, you will deploy a new instance of the AMQ broker.