The CoolStore online shop cannot function without the products list, however the inventory status is not a
crucial bit in the shopping experience. Let's add a circuit breaker for calls to the Inventory service and
provide a default inventory status when the Inventory service is not responsive.

In the **gateway-vertx** project, replace the `GatewayVerticle.java` code with
the following by clicking on *Copy to Editor*:

<pre class="file" data-filename="./src/main/java/com/redhat/cloudnative/gateway/GatewayVerticle.java" data-target="replace">
package com.redhat.cloudnative.gateway;

import io.vertx.circuitbreaker.CircuitBreakerOptions;
import io.vertx.core.http.HttpMethod;
import io.vertx.core.json.Json;
import io.vertx.core.json.JsonObject;
import io.vertx.ext.web.client.WebClientOptions;
import io.vertx.rxjava.circuitbreaker.CircuitBreaker;
import io.vertx.rxjava.core.AbstractVerticle;
import io.vertx.rxjava.ext.web.Router;
import io.vertx.rxjava.ext.web.RoutingContext;
import io.vertx.rxjava.ext.web.client.WebClient;
import io.vertx.rxjava.ext.web.codec.BodyCodec;
import io.vertx.rxjava.ext.web.handler.CorsHandler;
import io.vertx.rxjava.servicediscovery.ServiceDiscovery;
import io.vertx.rxjava.servicediscovery.types.HttpEndpoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import rx.Observable;
import rx.Single;

public class GatewayVerticle extends AbstractVerticle {
    private static final Logger LOG = LoggerFactory.getLogger(GatewayVerticle.class);

    private WebClient catalog;
    private WebClient inventory;
    private CircuitBreaker circuit;

    @Override
    public void start() {

        circuit = CircuitBreaker.create("inventory-circuit-breaker", vertx,
            new CircuitBreakerOptions()
                .setFallbackOnFailure(true)
                .setMaxFailures(3)
                .setResetTimeout(5000)
                .setTimeout(1000)
        );

        Router router = Router.router(vertx);
        router.route().handler(CorsHandler.create("*").allowedMethod(HttpMethod.GET));
        router.get("/health").handler(ctx -> ctx.response().end(new JsonObject().put("status", "UP").toString()));
        router.get("/api/products").handler(this::products);

        ServiceDiscovery.create(vertx, discovery -> {
            // Catalog lookup
            Single&lt;WebClient&gt; catalogDiscoveryRequest = HttpEndpoint.rxGetWebClient(discovery,
                    rec -> rec.getName().equals("catalog"))
                    .onErrorReturn(t -> WebClient.create(vertx, new WebClientOptions()
                            .setDefaultHost(System.getProperty("catalog.api.host", "localhost"))
                            .setDefaultPort(Integer.getInteger("catalog.api.port", 9000))));

            // Inventory lookup
            Single&lt;WebClient&gt; inventoryDiscoveryRequest = HttpEndpoint.rxGetWebClient(discovery,
                    rec -> rec.getName().equals("inventory"))
                    .onErrorReturn(t -> WebClient.create(vertx, new WebClientOptions()
                            .setDefaultHost(System.getProperty("inventory.api.host", "localhost"))
                            .setDefaultPort(Integer.getInteger("inventory.api.port", 9001))));

            // Zip all 3 requests
            Single.zip(catalogDiscoveryRequest, inventoryDiscoveryRequest, (c, i) -> {
                // When everything is done
                catalog = c;
                inventory = i;
                return vertx.createHttpServer()
                    .requestHandler(router::accept)
                    .listen(Integer.getInteger("http.port", 8080));
            }).subscribe();
        });
    }

    private void products(RoutingContext rc) {
        // Retrieve catalog
        catalog.get("/api/catalog").as(BodyCodec.jsonArray()).rxSend()
            .map(resp -> {
                if (resp.statusCode() != 200) {
                    new RuntimeException("Invalid response from the catalog: " + resp.statusCode());
                }
                return resp.body();
            })
            .flatMap(products ->
                // For each item from the catalog, invoke the inventory service
                Observable.from(products)
                    .cast(JsonObject.class)
                    .flatMapSingle(product ->
                        circuit.rxExecuteCommandWithFallback(
                            future ->
                                inventory.get("/api/inventory/" + product.getString("itemId")).as(BodyCodec.jsonObject())
                                    .rxSend()
                                    .map(resp -> {
                                        if (resp.statusCode() != 200) {
                                            LOG.warn("Inventory error for {}: status code {}",
                                                    product.getString("itemId"), resp.statusCode());
                                        }
                                        return product.copy().put("availability",
                                            new JsonObject().put("quantity", resp.body().getInteger("quantity")));
                                    })
                                    .subscribe(
                                        future::complete,
                                        future::fail),
                            error -> {
                                LOG.error("Inventory error for {}: {}", product.getString("itemId"), error.getMessage());
                                return product;
                            }
                        ))
                    .toList().toSingle()
            )
            .subscribe(
                list -> rc.response().end(Json.encodePrettily(list)),
                error -> rc.response().end(new JsonObject().put("error", error.getMessage()).toString())
            );
    }
}
</pre>

The above code wraps the calls to the Inventory
service in a `CircuitBreaker` using the built-in circuit breaker in 
Vert.x. The circuit breaker is configured to flip open after 3 
failures and time out on the calls after 1 second.

The `circuit.rxExecuteCommandWithFallback(...)` method, defines the fallback logic for
when the circuit is open and logs an error without calling the Inventory service in those
scenarios.

Build the API Gateway using Maven.

```
mvn package
```{{execute}}
