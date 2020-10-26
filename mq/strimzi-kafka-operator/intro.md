# Airflow Cluster on Kubernetes #

![Katacoda Logo](./assets/logo-text-with-head.png)

![strimzi_logo Logo](./assets/strimzi_logo.png)

![1-Connecting-to-leaders](./assets/1-Connecting-to-leaders.png)

Как клиенты знают, где подключиться?

## Kafka’s discovery protocol

**Kafka** имеет свой собственный протокол обнаружения **discovery protocol**. Когда клиент **Kafka** подключается к кластеру **Kafka**, он сначала подключается к любому брокеру, который является членом кластера, и запрашивает у него метаданные для одной или нескольких тем **topics**. Метаданные содержат информацию о темах **topics**, их **partitions** и **brokers**, которые размещают эти **partitions**. Все брокеры должны иметь данные для всего кластера, поскольку все они синхронизируются через **Zookeeper**. Следовательно, не имеет значения, к какому брокеру клиент подключен первым - все они дадут ему одинаковый ответ.

![1-Connection-flow](./assets/1-Connection-flow.png)

**Презентация Как Uber масштабировал свою инфраструктуру реального времени до триллиона событий в день**

https://docs.google.com/presentation/d/e/2PACX-1vSNAQLiv0tHKj2X4m_pBsU_3uxp_MUUDU9hyS0NpkEZdtwajzKZrIIv-wHiFiKEVmm5qAxIFmi0qoin/pub?start=true&loop=true&delayms=3000

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/1qO2qGuJNQI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Strimzi: Apache Kafka on Kubernetes in a few minutes**

![Uber Logo](./assets/uber-logo.jpg)

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/5NCiygjT2B4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Uber. Ankur Bansal. How Uber Audits Real time Infrastructure of Trillion+ Messages by Ankur Bansal**

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/K-fI2BeTLkk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Uber. Ankur Bansal. How Uber scaled its Real Time Infrastructure to Trillion events per day**



**Uber. Ankur Bansal. Introducing Chaperone: How Uber Engineering Audits Apache Kafka End-to-End**

https://eng.uber.com/chaperone-audit-kafka-messages/