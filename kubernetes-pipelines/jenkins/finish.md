# Conclusion #

You now understand fundamentally how Jenkins can run on Kubernetes. Jenkins runs the pipelines while it leverages Kubernetes to schedule the agents and to keep the engine running. Hopefully, you also understand how Kubernetes is a new type of data center _operating system_ that can run your applications - across multiple nodes on your local laptop, a rack of servers, or any cloud target.

## Technology stack ##

This demonstration was performed with these tools. Newer versions may exist.

- Kubernetes
- Kubectl
- Helm
- Prometheus Operator
- Kube-Prometheus (Alertmanager + Grafana)
- Python
- See jenkins-value.yaml file for Jenkins version and its plugins

## References ##

- [Jenkins](https://jenkins.io/)
- [Managing Resources](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)
- [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Helm, a package manager for Kubernetes](https://helm.sh/)
- [Canary deployments](
https://whatis.techtarget.com/definition/canary-canary-testing)
- [Jenkins stable Helm chart](https://github.com/kubernetes/charts/tree/master/stable/jenkins)
- [Kubernetes plugin for Jenkins](https://github.com/jenkinsci/kubernetes-plugin)
- [Jenkins agent with Docker and Kubectl](https://github.com/radu-matei/jenkins-slave-docker)

## Acknowledgments ##

- A special thanks to the inspiration for this tutorial from [Chris Ricci](https://github.com/cricci82) at CoreOS (now RedHat).
- This demonstration is based on Chris Ricci and Duffie Cooley, []*Continuous Deployment and Monitoring with Tectonic, Prometheus, and Jenkins*](https://www.brighttalk.com/webcast/14601/267207/continuous-deployment-and-monitoring-with-tectonic-prometheus-and-jenkins) presentation found here on BrightTALK. Starts at the 24:15 mark.

## Etcetera ##

- Instructional video: [Lachlan Evenson's](https://github.com/lachie83/croc-hunter) demonstration [Zero to Kubernetes CI/CD in 5 minutes with Jenkins and Helm](https://youtu.be/eMOzF_xAm7w)
- Instructional video: [Continuously delivering apps to Kubernetes using Helm - Adnan Abdulhussein (Bitnami)](https://youtu.be/CmPK93hg5w8)
- [Jenkins Slave with Docker client and kubectl CLI](https://github.com/radu-matei/jenkins-slave-docker)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>

