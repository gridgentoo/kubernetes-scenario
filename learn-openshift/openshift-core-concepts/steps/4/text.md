Когда мы используем команду **oc**, она вызывает API-вызов кластера OpenShift с использованием учетных данных пользователя **credentials**.

Давайте поговорим о каждом из типов пользователей в OpenShift.

UserType | Description
--- | ---
`Regular users` | *A regular OpenShift user. Regular users are usually developers with access to OpenShift projects. Regular OpenShift user examples include user1.*
`system:admin` | *OpenShift cluster administrator user.*
`system:openshift-registry` | *OpenShift registry user.*

Мы можем получить информацию о пользователе OpenShift, под которым мы сейчас вошли в систему, используя команду **oc whoami**:

`oc whoami`{{execute}}

Чтобы создать обычного пользователя, вы можете использовать команду **oc create user**:

`oc create user user1`{{execute}}

**Note:**  Нам не нужно устанавливать пароль пользователя в этой лабораторной работе, потому что наша лабораторная среда настроена на прием любого пароля от любого пользователя.

По умолчанию пользователь будет создан для проекта, над которым мы сейчас работаем. Чтобы получить список пользователей, используйте команду **oc get users**:

`oc get users`{{execute}}

Мы должны увидеть `user1`. 

Последнее, что нам нужно узнать, это как переключаться между разными пользователями. Для этого мы можем использовать команду **oc login**:

`oc login -u developer -p 1234 --insecure-skip-tls-verify [[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

Вы можете получить доступ к **`OpenShift Web Console`**, кликнув вкладку **`Dashboard`**, расположенную справа от окна терминала.
