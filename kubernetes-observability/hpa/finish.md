The scenario introduced the fundamental techniques to scale up and down your Pods in a Kubernetes cluster using the Horizontal Pod AutoScalar (HPA). There are more complex rules that can be applied to the HPA triggering logic and the HPA can reference metrics from other metrics registeries such as Prometheus. The HPA uses the standardized [Custom Metrics API](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/#support-for-custom-metrics) to reference metrics from different sources.

## Lessons Learned ##

With these steps you have learned how to:

- &#x2714; install the metrics-server for gathering metrics,
- &#x2714; install a Pod that can be scaled,
- &#x2714; define the scaling rules and the number of Pods to scale up and down,
- &#x2714; increase service demand to trigger scaling up,
- &#x2714; observe scaling up and down.

## References ##

- [Horizontal Pod Autoscaler Walkthrough](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/)
- [Horizontal Pod Scaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)
- [Cluster Node Scaling](https://github.com/kubernetes/autoscaler)
- [Vertical Pod Scaling](https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler)
- [Resource quotas](https://kubernetes.io/docs/concepts/policy/resource-quotas/)
- [Load testing tool, Locus](https://docs.locust.io/en/stable/what-is-locust.html)
- [Locust Helm Chart](https://github.com/helm/charts/tree/master/stable/locust)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
