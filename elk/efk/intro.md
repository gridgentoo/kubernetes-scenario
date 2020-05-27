# Kubernetes and Logging #

Этот сценарий ознакомит вас с основами деплоя и логгирования в KUBERNETES. 
Предполагается, что все логги, генерируемые контейнерами, объединяются в центральное хранилище данных DATASTORE. Из этого datastore запросы и фильтры создают [Вьюхи - views] из агрегированных логгов.

Контейнеры должны создавать логги (logs), только в виде потоков событий (event streams) и оставлять агрегацию и маршрутизацию (aggregation and routing) для других служб в Kubernetes. 
Этот паттерн подчеркивается как фактор [11 Logs](https://12factor.net/logs) методологии [Приложение «Двенадцать факторов» (https://12factor.net/).

Обычно три компонента ElasticSearch, Fluentd и Kibana (EFK) объединяются для стека. Иногда в стеке используется Fluent Bit вместо Fluentd. Fluent Bit в основном функционально одинаков, но легче по своим характеристикам и размеру. Другие решения иногда используют Logstash (ELK) вместо Fluentd.

В следующих шагах вы узнаете:

- Как развернуть ElasticSearch, Fluentd и Kibana
- Как создать log events и query, в Kibana

## Forwarding: Fluent Bit ##

![Fluent Bit](/kuber-ru/courses/elk/efk/assets/flb_002.png "fluent Bit")
<div style="text-align: right">- fluentbit.io</div>

[Fluentd] (https://www.fluentd.org/) - это сборщик данных data collector с открытым исходным кодом, который позволяет унифицировать сбор data collection и использование данных для лучшего использования и понимания данных. В этом стеке Fluent Bit запускается на каждом узле (DaemonSet) и собирает все Логги из /var/logs и направляет их в ElasticSearch.

This example could use a lighter variation of Fluentd called [Fluent Bit](https://fluentbit.io/). Perhaps EfK, with a lower case 'f' is apropos. [Alen Komljen](https://akomljen.com/) covers the reason why in his [blog](https://akomljen.com/get-kubernetes-logs-with-efk-stack-in-5-minutes/).

Another variation for logging is the E**L**K stack that includes Logstash as a substitution for the Fluent aggregation solution.

## Aggregation: ElasticSearch ##

Elasticsearch is a search engine based on the Lucene library. It provides a distributed, multitenant-capable full-text search engine with an HTTP web interface and schema-free JSON documents.

## Viewing: Kibana ##

[Kibana](https://www.elastic.co/products/kibana) is an open source data visualization plugin for Elasticsearch. It provides visualization capabilities on top of the content indexed on an Elasticsearch cluster. Users can create bar, line and scatter plots, or pie charts and maps on top of large volumes of data.

For Kubernetes there are a wide variety of ways to assemble EFK together, especially with a production or business critical clusters. Some solutions may leverage an ElasticSearch service outside the cluster, perhaps offered by a cloud provider. For any solution that's deployed to Kubernetes it's recommended to use Helm charts. Even with Helm charts there are a variety of solutions evolving and competing with each other.

However, this scenario is aimed to show how you can get a working stack up with reasonable ease so you can see how the components are installed and work with each other.
