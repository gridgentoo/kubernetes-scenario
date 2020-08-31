[Архитектура] Vert.X [30 августа 2020]

https://drive.google.com/drive/folders/1PKKuAnIqLoX3IrHefyQl1BD8I22kCXz5

[Архитектура] Vert.X + Hazelcast [30 августа 2020].  

https://drive.google.com/drive/folders/1wi_Kg5mKDUbftnNXPo442BOinxaSjmN6

[Архитектура] ServiceFabric Microsoft Azure [30 августа 2020]   

https://drive.google.com/drive/folders/1N9P7M2eAGCtbkMrcjcfVJQkqynD1g3XZ

[Архитектура] Vert.X + Ignite [30 августа 2020]

В этом сценарии вы узнаете больше о реактивных микросервисах **Reactive Microservices**, используя [Eclipse Vert.x](https://vertx.io), одну из сред выполнения **runtimes**, включенных в [Red Hat OpenShift Application Runtimes](https://developers.redhat.com/products/rhoar).

Этот сценарий является первым в списке сценариев, которые проведут вас через создание реактивного приложения с использованием **Vert.x**, иллюстрирующего, что такое **Vert.x**. Эти сценарии предлагают промежуточный практический сеанс с **Vert.x**, от первой строки кода до создания служб, их использования и, наконец, до сборки всего в единую реактивную систему **reactive system**. Этот сценарий, иллюстрирует, что такое реактивные системы **reactive system**, что такое реактивное программирование **reactive programming** и как создавать приложения на основе реактивных микросервисов **reactive microservices** (и это важно).

## The Micro-Trader Application

Разрабатываемое приложение **Vert.x** называется **``Micro-Trader``** и состоит из нескольких микросервисов, как показано ниже. Это **fake financial app**, в котором мы будем зарабатывать (виртуальные) деньги. Приложение состоит из следующих микросервисов:

* The quote generator - this is an absolutely unrealistic simulator that generates the quotes for 3 fictional companies MacroHard, Divinator, and Black Coat. The market data is published on the Vert.x event bus. It also publishes an HTTP endpoint to get the current value of the quote.
* The traders - these are a set of components that receives quotes from the quote generator and decides whether or not to buy or sell a particular share. To make this decision, they rely on another component called the portfolio service.
* The portfolio - this service manages the number of shares in our portfolio and their monetary value. It is exposed as a service proxy, i.e. an asynchronous RPC service on top of the Vert.x event bus. For every successful operation, it sends a message on the event bus describing the operation. It uses the quote generator to evaluate the current value of the portfolio.
* The audit - this is to keep a list of all our operations (yes, that’s the law). The audit component receives operations from the portfolio service via an event bus and address. It then stores theses in a database. It also provides a REST endpoint to retrieve the latest set of operations.
* The dashboard - some UI to let us know when we become rich.

Let’s have a look at the architecture:

![Architecture](/openshift/assets/middleware/rhoar-getting-started-vertx/reactive-ms-architecture.png)

The application uses several types of services:

* HTTP endpoint (i.e. REST API) - this service is located using an HTTP URL.
* gRPC - gRPC is a secure and fast RPC framework built on top of HTTP/2
* Message sources - these are components publishing messages on the event bus, the service is located using an (event bus) address.

All the components are going to be deployed in the same Kubernetes namespace (project), and will form a cluster.

The dashboard presents the available services, the value of each company’s quotes, the latest set of operations made by our traders and the current state of our portfolio. It also shows the state of the different circuit breakers.

![Architecture](/openshift/assets/middleware/rhoar-getting-started-vertx/dashboard.png)

## The first microservice - the quote generator

In this scenario, you are going to create the first microservice - the quote generator. In each subsequent scenario, you will create a microservice (from the set above) that will together form the Micro-Trader Application based on Vert.x.
