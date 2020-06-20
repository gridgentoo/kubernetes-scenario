[Portworx](https://portworx.com/) - это [cloud native storage](https://portworx.com/cloud-native-storage/) компания, от которой зависят предприятия, чтобы снизить стоимость и сложность быстрого развертывания контейнеризированных приложений в **multiple clouds**  и локальных средах. С Portworx вы можете управлять любой базой данных или сервисом с отслеживанием состояния **stateful service** в любой инфраструктуре, используя любой планировщик контейнеров **container scheduler**. Вы получаете единый уровень управления данными для всех ваших служб с отслеживанием состояния **stateful services**, независимо от того, где они работают

Популярные [Kubernetes storage](https://portworx.com/use-case/kubernetes-storage/) и [persistent storage for Docker](https://portworx.com/use-case/docker-persistent-storage/) решение **Portworx** представляет собой решение для кластерного хранения блоков  **clustered block storage** и обеспечивает уровень **Cloud-Native layer**, из которого **containerized stateful applications** программно используют сервисы хранения блоков **storage services**, файлов и объектов непосредственно через планировщик **scheduler**.

В этом руководстве вы узнаете, как развернуть **MongoDB** в **Kubernetes**, используя **Helm** и **Portworx**:

### Шаг: разверните **Helm** в нашем **Kubernetes cluster** 

На этом этапе мы покажем вам, как развернуть **Helm** в вашем кластере **Kubernetes**. [Helm](https://helm.sh/) **helps** вам управлять приложениями Kubernetes - **Helm Charts** помогают определять, устанавливать и обновлять даже самые сложные приложения **Kubernetes**. **Charts** легко создавать, **version**, **share** и **publish**, поэтому начните использовать **Helm** и остановите безумие копирования и вставки.

### Шаг: разверните **MongoDB** с помощью **Helm** с классом **Portworx Storage**

**Helm** мы будем использовать для развертывания [MongoDB chart](https://github.com/kubernetes/charts/tree/master/stable/mongodb). Чтобы обеспечить высокодоступный экземпляр **MongoDB**, мы настроим **chart** на использование **Portworx volume**, который мы создадим, чтобы обеспечить **3 replicas** данных. **Portworx** выполнит синхронную репликацию тома **volume**, чтобы данные **MongoDB** были надежно защищены. После развертывания **MongoDB** мы будем использовать **MongoDB client** для создания некоторых **data**.

Эта диаграмма иллюстрирует конфигурацию:

<img src="https://raw.githubusercontent.com/portworx/katacoda-scenarios/master/px-helm-mongo/images/MongoDB_using_PX_Volume.png" alt="MongoDB using PX Volume" style="width: 600px;"/>

### Шаг: Выполните тест аварийного переключения **failover test**

На этом этапе мы смоделируем сбой узла **node failure**, чтобы показать, как **Kubernetes** может перепланировать ваш **MongoDB pod** для запуска на другом **node** в вашем кластере. **Portworx** может гарантировать, что **rescheduled pod** подключает к нему данные из любой точки кластера, но делает шаг вперед, гарантируя, что **MongoDB pod** будет запланирован на узле, который имеет локальную копию данных **local copy of the data**, так что вы получите лучший уровень производительность **best level of performance**. Эта расширенная оркестровка **advanced orchestration** рабочих нагрузок с отслеживанием состояния обрабатывается **stateful workloads** [STorage ORchestrator for Kubernetes (STORK)](https://github.com/libopenstorage/stork/).

Эта диаграмма иллюстрирует сценарий отработки отказа **failover scenario**:

<img src="https://raw.githubusercontent.com/portworx/katacoda-scenarios/master/px-helm-mongo/images/mongo_failover.png" alt="MongoDB failover test" style="width: 600px;"/>

### Step: Expand the volume used by MongoDB

In this step we will show how Portworx volumes can be dynamically expanded with zero downtime. Portworx are thinly provisioned and the size of the PVC is used as a maximum size. Once you reach this upper limit on the size of your MongoDB database you can easily perform this operation to add more capacity to your volume.

This diagram illustrates the expansion of your volume:

<img src="https://raw.githubusercontent.com/portworx/katacoda-scenarios/master/px-helm-mongo/images/expanding_volume.png" alt="Expanding volumes" style="width: 600px;"/>


### Step: Take a snapshot and restore it

In this final step we will show how snapshots can be used with MongoDB volumes. Snapshots are efficient point-in-time copies of volumes that can be either read-write or read-only. Each snapshot is a volume in its own right and can be used freely by applications. They are implemented using a copy-on-write technique, so that they only use space in places where they differ from their parent volume.

This diagram illustrates the snapshot of your volume:

<img src="https://raw.githubusercontent.com/portworx/katacoda-scenarios/master/px-helm-mongo/images/mongo_snapshot.png" alt="Expanding volumes" style="width: 600px;"/>

### Другие вещи, которые вы должны знать

Чтобы узнать больше о том, как заупстить **Mongo on Portworx**- отличная идея, это посмотреть по следующим ссылкам:
* [Kubernetes MongoDB](https://portworx.com/ha-mongodb-kubernetes/) tutorial
* [HA MongoDB on GKE](https://portworx.com/run-ha-mongodb-gke/)
* [HA MongoDB on EKS](https://portworx.com/run-ha-mongodb-amazon-eks/)
* [HA MongoDB on AKS](https://portworx.com/run-ha-mongodb-aks/)
* [HA MongoDB on OpenShift](https://portworx.com/run-ha-mongodb-red-hat-openshift/)
* [Introduction to Portworx](https://portworx.com/products/introduction/)
* [Customer Stories](https://portworx.com/customers/)


В этом сценарии предполагается, что вы уже рассмотрели следующие сценарии:
* [How to install Portworx on Kubernetes](https://www.katacoda.com/kuber-ru/courses/portworx-cloud/deploy-px-k8s)
* [How to create Portworx volumes on Kubernetes](https://www.katacoda.com/kuber-ru/courses/portworx-cloud/px-k8s-vol-basic)
