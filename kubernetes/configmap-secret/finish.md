# Conclusion #

Keeping configurations and secrets out of your codebase is an important guideline for application on Kubernetes. Kubernetes can be deployed to a variety of data center targets and your application should also accommodate these different contextual settings. You learned, the environment configuration can all be stored in ConfigMaps and Secrets. This allows your applications to reference these configurations as environmental resources.

## Secrets and Protection ##

If you are interested in storing secrets safely in version control, consider this approach ["Sealed Secrets" for Kubernetes](https://github.com/bitnami-labs/sealed-secrets).

Since secrets are stored in etcd it's recommended to separate and firewall your etcd cluster. This is an advanced administration topic for Kubernetes, but it's important to keep your secrets _secret_. [See 11 Ways (Not) to Get Hacked](https://kubernetes.io/blog/2018/07/18/11-ways-not-to-get-hacked/#4-separate-and-firewall-your-etcd-cluster).

Lastly, enable RBAC and protect your Kubernetes API. Unprotected access to the cluster, such as through the dashboard, can unveil secrets. Invest in protecting your Kubernetes cluster and avoid what others have done in the past [Lessons from the Cryptojacking Attack at Tesla](https://redlock.io/blog/cryptojacking-tesla).

## Lessons Learned ##

With these steps you have learned:

- &#x2714; how to create configuration data in the form of ConfigMaps and Secrets,
- &#x2714; how Pods make configuration accessible for applications in containers,
- &#x2714; how secrets should remain secrets.

## References ##

- [__Free PDF__ of Kubernetes Up & Running: CHAPTER 11, ConfigMaps and Secrets](https://aaronmsft.com/static/180300/Kubernetes_Up_and_Running.pdf)
- [ConfigMap](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)
- [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)
- [Configuring Redis using a ConfigMap](https://kubernetes.io/docs/tutorials/configuration/configure-redis-using-configmap/)
- [Storage of secrets as plain text in etcd](https://github.com/bitnami-labs/sealed-secrets)
- [Vault](https://www.vaultproject.io/)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>

