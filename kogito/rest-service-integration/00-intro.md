
В этом сценарии вы узнаете 2 способа вызова микросервиса **RESTful** из **process/workflow** [Kogito](https://kogito.kie.org).

## Что такое Kogito?

![Logo](/openshift/assets/middleware/middleware-kogito/logo.png)

Реверс инжиниринг архитектуры Kogito-Runtimes  

https://github.com/gridgentoo/kogito-runtimes. 

Реверс инжиниринг архитектуры jbpm, a Business Process Management (BPM) Suite. 

https://github.com/gridgentoo/jbpm. 

Реверс инжиниринг архитектуры drools, Drools is a rule engine, DMN engine and complex event processing (CEP) engine for Java. 

https://github.com/gridgentoo/drools/. 


### BPMN2 и Services

Спецификация **BPMN2** определяет **_Service Task_** узел активности **activity node**, используемый для вызова автоматизированного приложения (или Сервиса) для выполнения задачи. В [Kogito](https://kogito.kie.org) **_Service Task_** может быть реализован с использованием bean-компонента **CDI bean (Quarkus)** или компонента **Spring bean (Spring Boot)**.

Имплементация CDI _Service Task_ позволяет нам внедрять в реализацию различные возможности и функции, чтобы мы могли, например, определить логику интеграции для подключения к внешним системам. В этом сценарии мы рассмотрим два варианта интеграции с микросервисом **RESTful**. 

Во-первых, мы воспользуемся клиентом **MicroProfile Rest Client** для вызова внешнего микросервиса. После этого мы заменим эту логику маршрутом [**Apache Camel**](https://camel.apache.org/) для вызова той же службы. Обратите внимание, что интеграция с **Camel** чрезвычайно интересна, поскольку **Camel** предоставляет широкий спектр разъемов для подключения практически к любому типу внешней системы (например, **SalesForce, Kafka, Twitter, SAP** и т. д.).

### Другие возможности

Узнайте больше на [kogito.kie.org](https://kogito.kie.org), или просто попробуйте далее!

