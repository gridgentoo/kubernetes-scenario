# Conclusion #

You now understand two different techniques for starting a container on Kubernetes. Nginx is commonly used for serving up web content and as you can see is easy to start on Kubernetes. There are thousands of other containers that can easily be started with these same basic steps.

## Lessons Learned ##

With these steps you have learned:

- &#x2714; how to use the basics of the kubectl CLI tool,
- &#x2714; how to install Nginx on Kubernetes,
- &#x2714; how containers are deployed as Deployments in Pods,
- &#x2714; how a Service can provide access to replications of Pods.

Hopefully, you also understand how Kubernetes is a new type of data center _operating system_ that can run your applications - across multiple nodes on your local laptop, a rack of servers, or any cloud target. If you are considering deploying multiple containers that make up a larger solution consider layering on Helm as a package manager for these manifests.

## References ##

- [Nginx](https://www.nginx.com/)
- [Managing Resources](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)
- [Round robin load balancing](https://en.wikipedia.org/wiki/Round-robin_DNS)
- [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Helm, a package manager for Kubernetes](https://helm.sh/)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
