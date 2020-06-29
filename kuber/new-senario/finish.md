# Conclusion #

Once an application is in a container, it's fairly simple to ask Kubernetes to serve up the container in multiple Pods fronted with a load balancing Service. Thereafter, Kubernetes dutifully respects your declared request by ensuring the application remains running on the cluster.

There are many other types of resources that can be added to Kubernetes besides just Pods, Services and Deployments, however these are the most common resources. Later, explore the Helm scenarios to see how whole _charts_ of more complex deployments can be installed.

## Lessons Learned ##

With these steps you have learned:

- &#x2714; how to **Deploy** an application,
- &#x2714; how to **Scale** an application,
- &#x2714; how to load balance an application with a **Service** for multiple **Pods** of an application,
- &#x2714; how **Resilience** maintains the declared state even with failures,
- &#x2714; how to **Roll out** new versions of an application.

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
