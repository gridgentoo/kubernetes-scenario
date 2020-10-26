As a supplement, a collection of supplemental [integrations](https://istio.io/latest/docs/ops/integrations/) is offered for the Istio control plane. Install them now, and we'll explore each one of them near the end of this scenario.

The integrations are based on just the major and minor numbers of the SemVer version if Istio. So extract the integrations version for the installations in this step:

`SEMVER_REGEX='[^0-9]*\([0-9]*\)[.]\([0-9]*\)[.]\([0-9]*\)\([0-9A-Za-z-]*\)'`{{execute}}

`INTEGRATIONS_VERSION=$(echo $ISTIO_VERSION | sed -e "s#$SEMVER_REGEX#\1#").$(echo $ISTIO_VERSION | sed -e "s#$SEMVER_REGEX#\2#") && echo $INTEGRATIONS_VERSION`{{execute}}

## Prometheus

[Prometheus](https://prometheus.io/) is an open source monitoring system and **time-series database for metrics**. You can use Prometheus with Istio to record metrics that track the health of Istio and applications within the service mesh. You can visualize metrics using tools like [Grafana](##Grafana) and [Kiali](##Kiali) that you will start below.

Istio provides a basic sample installation to quickly get Prometheus up and running:

`kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-$INTEGRATIONS_VERSION/samples/addons/prometheus.yaml`{{execute}}

## Grafana

[Grafana](https://grafana.com/) is a common **dashboard** used for cloud native observability. Grafana integrates well with time-series databases such as Prometheus and offers a language for creating custom dashboards for meaningful views into your metrics.

Grafana is an open source monitoring solution that can be used to configure dashboards for Istio. You can use Grafana to monitor the health of Istio and applications within the service mesh. Istio creates some optimized dashboards for viewing the mesh behaviors:

| Dashboard      | Observations |
|:--------------:|--------------|
| Mesh           | An overview of all services in the mesh. |
| Service        | Detailed breakdown of metrics for a service. |
| Workload       | Detailed breakdown of metrics for a workload. |
| Performance    | Monitors the resource usage of the mesh. |
| Control Plane  | monitors the health and performance of the control plane. |

Istio provides a basic sample installation to quickly get Grafana up and running, bundled with all of the Istio dashboards already installed:

`kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-$INTEGRATIONS_VERSION/samples/addons/grafana.yaml`{{execute}}

## Jaeger

[Jaeger](https://www.jaegertracing.io/) is an open source end to end distributed **tracing system**, allowing users to monitor and troubleshoot transactions in complex distributed systems.

Istio provides a basic sample installation to quickly get Jaeger up and running:

`kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-$INTEGRATIONS_VERSION/samples/addons/jaeger.yaml`{{execute}}

## Zipkin

Zipkin is a distributed **tracing** system. It helps gather timing data needed to troubleshoot latency problems in service architectures. Features include both the collection and lookup of this data.

Istio provides a basic sample installation to quickly get Zipkin up and running:

`kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-$INTEGRATIONS_VERSION/samples/addons/extras/zipkin.yaml`{{execute}}

## Kiali

[Kiali](https://kiali.io/) is an observability console for Istio with service mesh configuration and validation capabilities. It helps you understand the structure and health of your service mesh by monitoring traffic flow to infer the topology and report errors. Kiali provides detailed metrics and a basic [Grafana](##Grafana) integration, which can be used for advanced queries. Distributed tracing is provided by integration with [Jaeger](##Jaeger).

Istio provides a basic sample installation to quickly get Kiali up and running:

`kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-$INTEGRATIONS_VERSION/samples/addons/kiali.yaml`{{execute}}

## Observing

Now that all of these integrations have been added to Istio, they will continuously collect and monitor the information provided by Istio and all the Envoy proxies. First, we will get an application running, then we'll explore all the dashboards and metrics.
