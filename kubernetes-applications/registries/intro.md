# Container Registries on Kubernetes #

<img align="right" src="./assets/registry.png">

As a developer of containers and Kubernetes solutions, there is often a need to publish and pull containers through a private registry. When we are prototyping or testing it's handy to set up a local registry that just you or a small group can leverage. Kubernetes is ideal for hosting this solution.

The Registry is a stateless, highly scalable server-side application that stores and lets you distribute container images. The Registry is open-source, under the permissive [Apache license](http://en.wikipedia.org/wiki/Apache_License).

To learn how the registry works, you will build, push, and pull a real application with the registry. The application is a **_Breast Cancer Mitosis Detector_** provided by IBM. IBM governs [48+ open source projects](https://github.com/search?q=org%3AIBM+MAX&unscoped_q=MAX) covering various deep learning models.

## Key Features ##

- Follows the [Docker Registry HTTP API V2](https://docs.docker.com/registry/spec/api/)
- Accepts pushed containers
- Fulfills container requests
- Images persisted to backing PersistentVolume
- Easily hosted on Kubernetes

You will learn how:

- to install a private container registry on Kubernetes
- to install a web interface to reveal the contents of the registry.
