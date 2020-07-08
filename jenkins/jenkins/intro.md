# Jenkins on Kubernetes #

![Jenkins](/javajon/courses/kubernetes-pipelines/jenkins/assets/jenkins.png "Web server, reverse/mail proxy server")

## Canary Releases with Jenkins on Kubernetes ##

Эта демонстрация охватывает следующие темы **topics**:

- Personal Kubernetes кластер 
- Установите и настройте Jenkins из **Helm chart**
- Установка **Prometheus** из **Helm chart**
- Демонстрация плагина **Kubernetes** для **Jenkins**
- Построить, развернуть и запустить контейнер из **Jenkinsfile**
- Обновление контейнера с **canary deployment**
- Мониторинг развертывания **canary deployments**
- откат **Rollback canary**

> **Canary release** - это техника, позволяющий снизить риск внедрения новой версии программного обеспечения в **production** за счет **slowly rolling** изменений на небольшом подмножестве пользователей, прежде чем распространять его на всю инфраструктуру и делать его доступным для всех. - [MartinFowler.com](https://martinfowler.com/bliki/CanaryRelease.html)

## **Instructions** Обзор инструкций ##

- Запустить **personal Kubernetes cluster**
- Создайте учетную запись робота **Quay.io robot account** и скопируйте учетные данные **credentials**
- Установите **Jenkins** на кластере
- Сконфигурируйте **Jenkins**, чтобы использовать **Kubernetes**
- Создайте **pipeline**, который билдится и публикуется в **Kubernetes**.
- Roadmap: добавление стека мониторинга **Prometheus-Operator** из **Helm charts**
- Roadmap: наблюдение за **deployed container**
- Roadmap: посмотрите, как **canary deployments** работают с этим рабочим процессом

> [Jenkins]("https://en.wikipedia.org/wiki/Jenkins_%28software%28") сервер автоматизации с открытым исходным кодом, написанный на **Java**. **Jenkins** помогает автоматизировать нечеловеческую часть **non-human** процесса разработки программного обеспечения, обеспечивая непрерывную интеграцию **continuous integration** и облегчая технические аспекты непрерывной доставки **continuous delivery**. Это серверная система, которая работает в контейнерах сервлетов, таких как A**pache Tomcat**. Он поддерживает инструменты контроля версий, включая **AccuRev, CVS, Subversion, Git, Mercurial, Perforce, ClearCase** и **RTC**, и может выполнять проекты на основе **Apache Ant, Apache Maven** и **sbt**, а также произвольные **shell scripts** и **Windows batch commands**. Создатель Дженкинс - **Kohsuke Kawaguchi**. Выпущенная по лицензии **MIT**, **Jenkins** является свободным программным обеспечением
