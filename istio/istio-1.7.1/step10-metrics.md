With Istio's insight into how applications communicate, it can generate profound insights into how applications are working and performance metrics.

## Generate Load

To view the graphs, there first needs to be some traffic. Execute the command below to send requests to the application.

```bash
while true; do
  curl -s https://2886795283-80-simba08.environments.katacoda.com/productpage > /dev/null
  echo -n .;
  sleep 0.2
done
```{{execute}}

Access Dashboards
With the application responding to traffic the graphs will start highlighting what's happening under the covers.

## Grafana

The first is the Istio Grafana Dashboard. The dashboard returns the total number of requests currently being processed, along with the number of errors and the response time of each call.

https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com

As Istio is managing the entire service-to-service communicate, the dashboard will highlight the aggregated totals and the breakdown on an individual service level.

## Kiali

Kiali is the dashboard for Istio. A visual way to explore your mesh.

https://[[HOST_SUBDOMAIN]]-20001-[[KATACODA_HOST]].environments.katacoda.com

The credentials are `admin` / `admin`.

## Jaeger

Jaeger provides tracing information for each HTTP request. It shows which calls are made and where the time was spent within each request.

https://[[HOST_SUBDOMAIN]]-16686-[[KATACODA_HOST]].environments.katacoda.com

Click on a span to view the details on an individual request and the HTTP calls made. This is an excellent way to identify issues and potential performance bottlenecks.
