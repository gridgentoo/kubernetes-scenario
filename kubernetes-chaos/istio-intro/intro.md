<img align="right" src="./assets/istio.png" width="300">

Istio 1.7.3	September 29, 2020  
Istio 1.7.2	September 18, 2020  
Istio 1.7.1	September 10, 2020  
Istio 1.7	August 21, 2020  

Networking layers have traditionally been a burden on engineering organization to get networking right. Networking layers such as meshes look as clusters as a whole and attempt to add networking controls. An efficient mesh is one that can be declared with infrastructure-as-code ([IaC](https://en.wikipedia.org/wiki/Infrastructure_as_code)).

Istio is a specific networking mesh you can add to your cloud native cluster. It's tuned for ease of use with Kubernetes, and can be used for meshing other services outside of Kubernetes. Use Istio for declarative control over of these networking architecture x-ilities:

- Connectability
- Securability
- Controllability
- Observability

[Istio](https://istio.io/latest/docs/concepts/what-is-istio/) (in the Greek alphabet, ιστίο) is Greek for the noun “sail,” and is pronounced ["iss-teeh-oh."](http://www.howtopronounce.cc/istio).

> At a high level, Istio helps reduce the complexity of these deployments, and eases the strain on your development teams. It is a completely open source service mesh that layers transparently onto existing distributed applications. It is also a platform, including APIs that let it integrate into any logging platform, or telemetry or policy system. Istio’s diverse feature set lets you successfully, and efficiently, run a distributed microservice architecture, and provides a uniform way to secure, connect, and monitor microservices.

This scenario has been adapted Istio' [Getting Started guide](https://istio.io/latest/docs/setup/getting-started).

In the following steps you will learn:

- how to install Istio on Kubernetes following its recommended best practices,
- how to install Istio's Bookinfo as a _Hello World_ for Istio.
- how to start manipulating Istio declarations to control your network close to the application plane.
