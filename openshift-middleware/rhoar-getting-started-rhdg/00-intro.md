## Цели обучения

В этом интерактивном руководстве показано, как развернуть и запустить один экземпляр **single instance** [RHDG](https://www.redhat.com/en/technologies/jboss-middleware/data-grid) Red Hat Data Grid в OpenShift.

Вы изучите, как открыть конечную точку **REST endpoint** и вызвать простые операции кэширования **cache operations**.

## Введение в Red Hat Data Grid

![Logo](/openshift/assets/middleware/rhoar-getting-started-rhdg/rhdg-logo.jpg)

Red Hat Data Grid (RHDG) - это **in-memory data store** хранилище данных в памяти с открытым исходным кодом, которое:

* Хранит данные в памяти (RAM) **Stores data in memory (RAM),** обеспечивая быстрое время отклика с низкой задержкой **low-latency** и очень высокую пропускную способность **high throughput**.
* Синхронизирует данные между несколькими нодами для обеспечения **continuous availability**, надежности **reliability** и эластичной масштабируемости **elastic scalability**.
* Offers flexibility - предлагает гибкость. Вы можете использовать его в качестве распределенного кэша **distributed cache**, **NoSQL database** или **event broker**.

RHDG улучшают производительность **application performance** и масштабируемость **scalability** приложений, уменьшая необходимость совершать дорогостоящие вызовы к **database management systems** и транзакционным бекэндом **transactional back ends**.

<iframe style="width: 700px;height: 400px;" src="https://www.youtube-nocookie.com/embed/OXL4EAS8RXw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>