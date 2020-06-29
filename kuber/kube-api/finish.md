# Conclusion #

The Kubernetes API server is the gateway into Kubernetes and is accessed via HTTP. All administrative interactions with Kubernetes is through this API. External command-line tools, language libraries, and internal controllers and operators all use this same API for all CRUD operations toward Kubernetes.

## Lessons Learned ##

With these steps you have learned:

- &#x2714; how to access the API via `kubectl`,
- &#x2714; how to introspect objects in the cluster via the API,
- &#x2714; how to access the cluster API locally through a Proxy,
- &#x2714; how to reference api-resources and api-versions
- &#x2714; how to `Explain` and `Describe` resources.

## Special Thank You

To **[Ken Sipe](https://www.linkedin.com/in/kensipe/)** as he inspired this scenario from [his labs found here](https://github.com/kensipe/k8s-ext-workshop).

## References ##

- [The Kubernetes API](https://kubernetes.io/docs/concepts/overview/kubernetes-api/)
- [Kubectl Cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [jq](https://stedolan.github.io/jq/)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
