В этом сценарии вы узнаете, как имлементировать логику процессов **workflow logic** с помощью компонентов CDI в [Kogito](https://kogito.kie.org).

![Logo](/openshift/assets/middleware/middleware-kogito/logo.png)

Реверс инжиниринг архитектуры Kogito-Runtimes  

https://github.com/gridgentoo/kogito-runtimes. 

Реверс инжиниринг архитектуры jbpm, a Business Process Management (BPM) Suite. 

https://github.com/gridgentoo/jbpm. 

Реверс инжиниринг архитектуры drools, Drools is a rule engine, DMN engine and complex event processing (CEP) engine for Java. 

https://github.com/gridgentoo/drools/. 

### BPMN2 Service Task and CDI

Спецификация **BPMN2** определяет **_Service Task_**, узел активности, используемый для вызова автоматизированного приложения (или Сервиса) для выполнения задачи. 
В [Kogito](https://kogito.kie.org), a **_Service Task_**  может быть реализован с использованием **CDI bean (Quarkus)** или компонента **Spring bean (Spring Boot)**. В этом сценарии мы продемонстрируем эту функциональность с помощью  [Quarkus](https://www.quarkus.io).

**Context & Dependency Injection (CDI)** позволяет разработчикам легко создавать логику процессов и **workflow logic** стандартным способом Java для построения логики приложения. Разработчики могут сосредоточиться на разработке бизнес-логики, а не на изучении новых фреймворков и расширений для построения логики процесса. Эти компоненты **CDI beans**, в свою очередь, могут быть внедрены с другой логикой (например, **Camel** для интеграции, **JPA** для сохранения, **SmallRye Reactive Messaging** для обмена сообщениями и т. Д.).

### Другие возможности

Узнайте больше на [kogito.kie.org](https://kogito.kie.org), или просто попробуйте далее!
