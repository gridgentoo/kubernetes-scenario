В этом сценарии вы узнаете больше о разработке приложений **Spring Boot** с использованием платформы [Red Hat OpenShift Application Runtimes](https://developers.redhat.com/products/rhoar). Мы создадим простое приложение **Spring Boot**, которое будет создавать сообщения и принимать сообщения из ресурса [JBOSS AMQ](https://www.redhat.com/en/technologies/jboss-middleware/amq). 

## Обзор

[Автор оригинала: Jakub Korab] Понимание брокеров сообщений. Изучение механики обмена сообщениями посредством ActiveMQ и Kafka. Глава 1

https://habr.com/ru/post/466385/

[Автор оригинала: Jakub Korab] Понимание брокеров сообщений. Изучение механики обмена сообщениями посредством ActiveMQ и Kafka. Глава 2. ActiveMQ 

https://habr.com/ru/post/471268/

[Автор оригинала: Mark E Taylor] Разработка MQ JMS приложения на Spring Boot

https://habr.com/ru/post/479232/

AMQ обеспечивает быстрый, легкий и безопасный обмен сообщениями **secure messaging** для приложений **Internet-scale**. Компоненты **AMQ** используют стандартные протоколы сообщений и поддерживают широкий спектр языков программирования и операционных сред. **AMQ** дает вам прочную основу, необходимую для создания современных распределенных приложений **distributed applications**.


## Что такое AMQ Broker?

AMQ Broker - это мультипротокольный брокер сообщений **message broker** на чистом Java. Он построен на эффективном асинхронном ядре **asynchronous core** с быстрым **native journal** для сохранения сообщений **message persistence**  и возможностью репликации состояния **state replication** для обеспечения высокой доступности **high availability**.

* **Persistence** - быстрый, **native-IO journal** или хранилище на основе **JDBC-based store**
* **High availability** - **Shared store** или репликация состояния **state replication** 
* **Advanced queueing** - Last value queues, группы сообщений **message groups**, иерархии топиков **topic hierarchies**,и поддержка больших сообщений **large message support**
* **Multiprotocol** - AMQP 1.0, MQTT, STOMP, OpenWire, and HornetQ Core

**AMQ Broker** основан на проекте [Apache ActiveMQ Artemis](https://activemq.apache.org/artemis/).

## Чему вы научитесь

В этом руководстве вы узнаете, как настроить экземпляр брокера сообщений **Red Hat AMQ** message broker, работающий в **OpenShift**.