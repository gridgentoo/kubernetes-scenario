With HotROD started, view the application at https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/

Within the application, by clicking one of the four buttons we summon a car to arrive to the customer’s location, perhaps to pick up a product and deliver it elsewhere. Once a request for a car is sent to the backend, it responds with the car’s license plate number and the expected time of arrival.

There are a few bits of debugging information we see on the screen.

1) In the top left corner there is a web client id: 9323. It is a random session ID assigned by Javascript UI; if we reload the page we get a different session ID.

2) In the line about the car we see a request ID req: 9323–1. It is a unique ID assigned by Javascript UI to each request it makes to the backend, composed of the session ID and a sequence number.

3) The last bit of debugging data, latency: 782ms, is measured by the Javascript UI and shows how long the backend took to respond.

This additional information has no impact on the behavior of the application, but will be useful when we look under the hood.
