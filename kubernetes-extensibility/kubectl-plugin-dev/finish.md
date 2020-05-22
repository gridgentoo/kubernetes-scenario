# Conclusion #

Kubectl offers a helpful plugin feature to extend Kubernetes. The [Community supported plugins](https://github.com/kubernetes-sigs/krew-index/) are quite helpful. But sometimes, what the community offers is not what you need. Fortunately, you can code you own plugin to solve specific problems related to your domain. If you do create a plugin that can help others, consider adding it to the public community of kubectl plugins.

## Lessons Learned ##

With these steps you have learned:

- &#x2714; how to layout the source directory structure for a kubectl plugin,
- &#x2714; how to connect implementation logic to command,
- &#x2714; how to work with client references that can administer Kubernetes,
- &#x2714; how to list and create Pods via a custom plugin

## Special Thank You

To [**Ken Sipe**](https://www.linkedin.com/in/kensipe/) as he inspired this scenario from [his labs found here](https://github.com/kensipe/k8s-ext-workshop).

## References ##

- [Extend kubectl with plugins](https://kubernetes.io/docs/tasks/extend-kubectl/kubectl-plugins/)
- [Community supported plugins](https://github.com/kubernetes-sigs/krew-index/)
- [The Kubernetes API](https://kubernetes.io/docs/concepts/overview/kubernetes-api/)
- [Plugin Example Skeleton from **Ken Sipe**](https://github.com/codementor/k8s-cli)
- [Github: sample-cli-plugin](https://github.com/kubernetes/sample-cli-plugin)
- [client-go](https://github.com/kubernetes/client-go)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
