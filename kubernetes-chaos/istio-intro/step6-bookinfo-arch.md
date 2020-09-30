The Bookinfo sample application deployed is composed of four microservices.

| Microservice  | Description                                                                      |
|---------------|----------------------------------------------------------------------------------|
| Productpage   | Serves the homepage, populated using the details and reviews microservices.      |
| Details       | Contains the book information.                                                   |
| Reviews       | Contains the book reviews. It uses the ratings microservice for the star rating. |
| Ratings       | Provides the book rating for a book review.                                      |

The deployment includes three versions of the reviews microservice to showcase different behavior and routing:

1. Review v1 doesn’t call the ratings service, **no stars**.
1. Review v2 calls the ratings service and displays each rating as 1 to 5 **black stars**.
1. Review v3 calls the ratings service and displays each rating as 1 to 5 **red stars**.

All services communicate over HTTP using DNS for service discovery. An overview of the architecture is shown below.

<image src="./assets/withistio.png" width="100%">
Bookinfo Architecture

Unbeknownst to the Bookinfo containers, the Envoy sidecars injected next to each microservice and surreptitiously intercept all inbound and outbound Pod traffic.

The source code for the application is available on [GitHub](https://github.com/istio/istio/tree/release-0.1/samples/apps/bookinfo/src).
