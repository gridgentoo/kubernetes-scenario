# Sidecar containers #

<img align="right" width="300" src="./assets/dog-in-sidecar.jpg">

These next steps provide a simple introduction to the idea of putting two containers in a Pod to achieve the sidecar pattern. The primary advantage of sidecars is the separation of concerns. Each container is highly cohesive in terms of responsibilities, yet they work together to provide a single solution.

With a Kubernetes cluster and a CLI tool called _kubectl_, a few steps will get an Nginx web server running along with its sidecar.

You will learn how:

- to use the basics of the kubectl CLI tool,
- to install Nginx on Kubernetes,
- containers are deployed as Deployments in Pods,
- a Service can provide access to a replication of Pods,
- two containers can work together to provide a solution,
- two containers can share information through a shared file mount.

> [Nginx](https://www.nginx.com) is a web server that can also be used as a reverse proxy, load balancer, mail proxy, and HTTP cache. The software was created by Igor Sysoev and first publicly released in 2004. A company of the same name was founded in 2011 to provide support and Nginx plus paid software.

> Nginx is free and open-source software, released under the terms of a BSD-like license. A large fraction of web servers use NGINX, often as a load balancer. [-- Wikipedia](https://en.wikipedia.org/wiki/Nginx)