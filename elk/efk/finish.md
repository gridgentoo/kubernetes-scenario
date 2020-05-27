# Conclusion #

This stack is a good example of how Kubernetes can be used to bring distinct tools together so they can work in concert for a larger solution. In this case for log aggregation. Because Fluent Bit is installed as a DaemonSet it will be on every node dutifully collection the log streams and sending them to ElasticSearch where in turn Kibana offers a viewport into specific data based on your queries.

It's important your application also logs the transaction [correlation IDs](https://twitter.com/samnewman/status/862255875125366786?lang=en) as a way to gather log events from a known transaction. This is also true for transaction tracing (a separate Katacoda scenario, [Transaction Tracing](https://www.katacoda.com/javajon/courses/kubernetes-observability)).

Each one of the three components is highly configurable and this scenario provides a starting point for getting this observability pattern ready for production.

## Lessons Learned ##

With these steps you have learned:

- &#x2714; how to configure and deploy ElasticSearch, Fluent Bit, and Kibana on Kubernetes
- &#x2714; how to generate log events and query them with Kibana

## References ##

- [Fluent](https://www.fluentd.org/)
- [Fluent Bit](https://fluentbit.io/)
- [Kibana](https://www.elastic.co/products/kibana)
- [Getting started with EFK (Fluent Bit, Elasticsearch and Kibana) stack in Kubernetes, John Bryan Sazon](https://medium.com/@jbsazon/aggregated-kubernetes-container-logs-with-fluent-bit-elasticsearch-and-kibana-5a9708c5dd9a)"
- [Installing ElasticSearch using Helm Charts](https://vocon-it.com/2019/03/04/kubernetes-9-installing-elasticsearch-using-helm-charts/)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
