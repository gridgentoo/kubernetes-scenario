# Conclusion #

You now understand two different techniques for starting a container on Kubernetes. Nginx is commonly used for serving up web content and as you can see is easy to start on Kubernetes. There are thousands of other containers that can easily be started with these same basic steps.

## Lessons Learned ##

With these steps you have learned how:

- &#x2714; to use the basics of the kubectl CLI tool,
- &#x2714; to install Nginx on Kubernetes,
- &#x2714; containers are deployed as Deployments in Pods,
- &#x2714; a Service can provide access to a replication of Pods,
- &#x2714; two containers work together to provide a solution,
- &#x2714; two containers share information through a shared file mount.

## References ##

- [Shared volumes](https://kubernetes.io/docs/tasks/access-application-cluster/communicate-containers-same-pod-shared-volume/)
- [Nginx](https://www.nginx.com/)
- [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Linux Inter-process communications](https://www.tldp.org/LDP/tlk/ipc/ipc.html)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
