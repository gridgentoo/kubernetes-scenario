# Conclusion #

OpenFaaS is an independent project created by [Alex Ellis](https://www.alexellis.io/) that is being built and shaped by a growing community of contributors. Kubernetes provides this serverless framework a resilient and scalable cluster where OpenFaaS can compliment other solutions in the same shared data center.

## Lessons Learned ##

With these steps you have learned:

- &#x2714; how to install OpenFaaS on Kubernetes,
- &#x2714; how to interact with OpenFaaS from the command-line and its portal,
- &#x2714; how functions are deployed and removed,
- &#x2714; how functions are named, exposed, and invoked,
- &#x2714; how functions are listed, inspected and monitored,
- &#x2714; how functions automatically scale up and down based on load.

## References ##

- [OpenFaaS project](https://www.openfaas.com/)
- [OpenFaaS is open source](https://github.com/openfaas/faas)
- [OpenFaaS documentation](https://docs.openfaas.com/)
- [CLI tool](https://github.com/openfaas/faas-cli)
- [OpenFaaS Operator Helm chart *](https://github.com/openfaas-incubator/openfaas-operator)
- [OpenFaaS Operator Helm chart based on faas-netes Helm chart *](https://github.com/openfaas/faas-netes)
- [Helm, a package manager for Kubernetes](https://helm.sh/)
- [Helm chart for OpenFaaS](https://github.com/openfaas-incubator/openfaas-operator)
- [Video: Scaling in action with Prometheus](https://www.youtube.com/watch?v=0DbrLsUvaso)

> \* [Faas-netes chart versus OpenFaaS Operator chart](https://github.com/openfaas/faas-netes/tree/master/chart/openfaas#faas-netes-vs-openfaas-operator)
> The faas-netes controller is the most tested, stable and supported version of the OpenFaaS integration with Kubernetes. In contrast the OpenFaaS Operator (used in this scenario) is based upon the codebase and features from faas-netes, but offers a tighter integration with Kubernetes through [CustomResourceDefinitions](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/) (CRD). This means you can type in `kubectl get functions` to list the CRD that make this `Kind: function` possible.

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
