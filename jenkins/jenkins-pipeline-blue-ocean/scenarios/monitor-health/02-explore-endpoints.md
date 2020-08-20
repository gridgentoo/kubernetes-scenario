Spring Boot, WildFly Swarm and Vert.x all provide out-of-the-box support for creating RESTful endpoints that
provide details on the health of the application. These endpoints by default provide basic data about the 
service however they all provide a way to customize the health data and add more meaningful information (e.g. 
database connection health, backoffice system availability, etc).

[Spring Boot Actuator](http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#production-ready) is a 
sub-project of Spring Boot which adds health and management HTTP endpoints to the application. Enabling Spring Boot 
Actuator is done via adding `spring-boot-starter-actuator` dependency to the Maven project 
dependencies which is already done for the Catalog services.

Verify that the health endpoint works for the Catalog service using `curl` replacing `CATALOG-ROUTE-HOST`
with the Catalog route url:

> Find out route urls by `oc get route`

```
curl http://CATALOG-ROUTE-HOST/health
```

You should see a response like:

```
{"status":"UP", ...}
```

[WildFly Swarm health endpoints](https://wildfly-swarm.gitbooks.io/wildfly-swarm-users-guide/content/advanced/monitoring.html) function in a similar fashion and are enabled by adding WildFly Swarm `monitor`
to the Maven project dependencies. 
This is also already done for the Inventory service.

Verify that the health endpoint works for the Inventory service using `curl` replacing `INVENTORY-ROUTE-HOST`
with the Catalog route url:

```
curl http://INVENTORY-ROUTE-HOST/node
```

You should see a response like:

```
{
    ...
    "server-state" : "running",
    ...
}
```

Expectedly, Eclipse Vert.x also provides a [health check module](http://vertx.io/docs/vertx-health-check/java) 
which is enabled by adding `vertx-health-check` as a dependency to the Maven project. 

Verify that the health endpoint works for the Inventory service using `curl` 
replacing `API-GATEWAY-ROUTE-HOST` with the API Gateway route url:

```
curl http://API-GATEWAY-ROUTE-HOST/health
```

You should see a response like:

```
{"status":"UP"}
```

Last but not least, although you can build more sophisticated health endpoints for the Web UI as well, you 
can use the root context of the Web UI in this scenario to verify it's up and running.
