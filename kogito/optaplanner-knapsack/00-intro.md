В этом сценарии вы узнаете, как имплементировать [OptaPlanner](https://www.optaplanner.org) приложение на [Quarkus](https://www.quarkus.io).

![Logo](/openshift/assets/middleware/middleware-kogito/logo.png)
![Logo](/openshift/assets/middleware/middleware-kogito/optaPlannerLogo.png)

Реверс инжиниринг архитектуры Kogito-Runtimes  

https://github.com/gridgentoo/kogito-runtimes. 

Реверс инжиниринг архитектуры jbpm, a Business Process Management (BPM) Suite. 

https://github.com/gridgentoo/jbpm. 

Реверс инжиниринг архитектуры drools, Drools is a rule engine, DMN engine and complex event processing (CEP) engine for Java. 

https://github.com/gridgentoo/drools/. 

### Knapsack Problem

Задача о рюкзаке **knapsack problem**  - это проблема комбинаторной оптимизации **combinatoral optimization**: задан рюкзак, который может содержать максимальный вес, и набор предметов с определенным весом и стоимость, определяют комбинацию предметов, которые нужно положить в рюкзак, чтобы максимизировать ценность содержимого, не превышая предельного веса рюкзака.

![Knapsack Problem](https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Knapsack.svg/500px-Knapsack.svg.png)

(image source: https://commons.wikimedia.org/wiki/File:Knapsack.svg , license: https://creativecommons.org/licenses/by-sa/2.5/deed.en)

В этом примере у нас есть слитки разного веса и стоимости, которые мы хотим положить в рюкзак. OptaPlanner выберет комбинацию слитков, которая не будет превышать максимальный вес ранца, но обеспечит максимально возможное значение.

**OptaPlanner** - это **A.I.** решатель удовлетворения ограничений - **constraint satisfaction solver**, который обеспечивает масштабируемую платформу для поиска оптимальных решений NP-полных и NP-сложных проблем, **NP-complete and NP-hard problems**. 

**OptaPlanner** позволяет нам писать эти решения на простом языке **Java**, что делает эту технологию доступной для большой группы разработчиков программного обеспечения. Кроме того, расширение **OptaPlanner Quarkus** позволяет нам писать наше приложение **OptaPlanner** как облачный микросервис.

### Другие возможности

Узнайте больше на [kogito.kie.org](https://kogito.kie.org), или просто попробуйте далее!
