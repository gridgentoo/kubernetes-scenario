## Persistent Volume ##

`ls`{{execute}}

`nano pv-postgres.yaml`{{execute}}

`nano pv-sonarqube.yaml`{{execute}}

**SonarQube** создаст два **PersistentVolumeClaims**, один для **SonarQube** и один для базы данных **Postgres**. Для каждого потребуется **PersistentVolume**.

[hostPath based PersistentVolume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume) созданы для обоих **Persistent Volume**.

`mkdir -p /mnt/data/postgres && kubectl create -f pv-postgres.yaml`{{execute}}

`mkdir -p /mnt/data/sonarqube && kubectl create -f pv-sonarqube.yaml`{{execute}}

## Install ##

Создайте пространство имен для цели установки.

`kubectl create namespace sonarqube`{{execute}}

Смотрим какая версия сейчас актуальна:

`helm search repo sonarqube`{{execute}}

`helm repo update`{{execute}}

Этот **chart** устарел и перемещен на https://github.com/oteemo/charts.

`helm repo add oteemocharts https://oteemo.github.io/charts`{{execute}}

Используя **Helm**, установите диаграмму **SonarQube Helm** с несколькими **custom values**.

`helm install sonar stable/sonarqube --version 6.4.1 --namespace sonarqube -f sonarqube-values.yaml`{{execute}}

Этот *chart bootstraps** загружает экземпляр **SonarQube** вместе с базой данных **PostgreSQL**. **SonarQube** также загружает несколько плагинов, определенных в конфигурации **Helm chart**. Чтобы получить полный статус доступности деплоймента, выполните эту проверку.

`watch kubectl get deployments,pods,services --namespace sonarqube`{{execute}}

После завершения **Pod** перейдет в состояние **running state**. Развертывание **deployment.extensions/sonar-sonarqube** может занять 2-3 минуты, прежде чем оно сообщит **Available**. Поведение плагинов может повлиять на время запуска. Все развертывания будут в конечном итоге перейдите в состояние **Available (1) state**. Используйте это ```clear```{{execute interrupt}}, чтобы выйти из режима **watch** или нажмите <kbd>Ctrl</kbd>+<kbd>C</kbd>.