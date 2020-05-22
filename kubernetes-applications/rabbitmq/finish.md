# Conclusion #

You now understand how to run a basic configuration of RabbitMQ on Kubernetes. Actual production deployment can certainly be more complex to support persistence and higher availability. If the existing Helm chart is insufficient, consider contributing to the project or create one for your own needs.

## Lessons Learned ##

With these steps you have learned:

- &#x2714; how to use the basics of the kubectl and helm CLI tool,
- &#x2714; how to install RabbitMQ on Kubernetes.

Hopefully, you also understand how Kubernetes is a new type of data center _operating system_ that can run your applications - across multiple nodes on your local laptop, a rack of servers, or any cloud target. If you are considering deploying multiple containers that make up a larger solution consider layering on Helm as a package manager for these manifests.

## References ##

- [RabbitMQ](https://www.rabbitmq.com/)
- [RabbitMQ stable Helm chart](https://github.com/helm/charts/tree/master/stable/rabbitmq). 
- [Managing Resources](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)
- [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Helm, a package manager for Kubernetes](https://helm.sh/)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
