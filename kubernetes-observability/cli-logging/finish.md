The scenario introduced some fundamental techniques to inspecting events and application logs on Kubernetes. Because Kubernetes is distributed, you cannot just inspect logs found in a single directory.

 Beyond this scenario, explore techniques to automate log aggregation and synchronization. Logs are stored in the `/var/log/container` and `/var/log/pods` directories, which as considered ephemeral. DaemonSets on the Nodes and Sidecars in the Pods can centralize and sync these logs to other services. The other services, like Elasticsearch, offer reliable long-term persistence, rich queries, and automatic alerting based on the rules often defined by Site Reliability Engineers (SREs). As a next step, explore the _Logging with EFK_ scenario.

## Lessons Learned ##

With these steps you have learned how to:

- &#x2714; ensure your 12-factor application generates logs to streams,
- &#x2714; inspect Kubernetes cluster events,
- &#x2714; inspect container logs across multiple Pods,
- &#x2714; use some convenient command-line tools to view log aggregations.

## References ##

- [Logging Architecture](https://kubernetes.io/docs/concepts/cluster-administration/logging/#logging-at-the-node-level)
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#interacting-with-running-pods)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
