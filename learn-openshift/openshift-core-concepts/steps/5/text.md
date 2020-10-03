Первая и самая важная команда для запуска в OpenShift - это **oc new-app**. 
Эта команда похожа на команду Kubernetes **kubectl run**, но **oc new-app** намного мощнее и работает немного иначе.
Позже в этой главе мы покажем вам, как работает **oc new-app**.

Лучший способ протестировать команду **oc new-app** - создать новый проект, а затем запустить его:

`oc new-project project1`{{execute}}

```
Now using project "project1" on server "https://127.0.0.1:8443".
You can add applications to this project with the 'new-app' command. For example, try:

    oc new-app centos/ruby-22-centos7~https://github.com/openshift/ruby-ex.git
to build a new example application in Ruby.
```

Выходные данные команды говорят нам запустить команду **oc new-app**. Запустите команду, чтобы посмотреть, как это работает:

`oc new-app centos/ruby-22-centos7~https://github.com/openshift/ruby-ex.git`{{execute}} 

 * Будет создан **image stream** как **"ruby-22-centos7:latest"**, который будет отслеживать **source image**
 * Будет создана исходная сборка **build** с использованием **source code**  https://github.com/openshift/ruby-ex.git.
 * Полученный **image** будет **pushed** помещено в **image stream** "ruby-ex: latest".
 * Каждый раз при изменении **"ruby-22-centos7:latest"** новый билд будет собран на основании **triggered**.
 * Этот **image** будет развернут в конфигурации развертывания **"ruby-ex"**.
 * Нагрузка на порт 8080/tcp будет сбалансирована сервисом **"ruby-ex"**
 * Другие контейнеры могут получить доступ к этому сервису **service** через имя хоста **"ruby-ex"**.
...
<output omitted>
...

Запустите `oc status`{{execute}}, чтобы просмотреть свое приложение.

Будет много вывода по сравнению с тем, что мы видели раньше, но если вы прочитаете, вы сможете узнать, что:

- **OpenShift** извлекает Docker image **centos/ruby-22-centos7**
- **OpenShift** переходит на **GitHub** и загружает с него исходный код.
- **OpenShift** применяет исходный код **GitHub** к image и сохраняет его во внутреннем реестре **internal registry** под именем **ruby-ex**.
- **ruby-ex** используется для build и deployment конфигурации
- Сервис **ruby-ex service** создан для балансировки нагрузки трафика для подов с **ruby-ex** в их **names**.

Посмотрим наши проекты:

`oc projects`{{execute}}
