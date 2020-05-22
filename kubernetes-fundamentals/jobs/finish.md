# Conclusion #

Job are much like Pods, but differ since they terminate once the task is completed. The Job feature ensures the job complete successfully and can optionally rerun the tasks until a success is reported. 

Job efficiently run in parallel. Where once you may have been inclined to multi-thread the application in the container, you can instead keep the container a simple task runner and rely on Kubernetes resource management and Job parallelism to a achieve threading with a more effect pattern.

When combined with a queuing or messaging mechanism, Jobs can asynchronously process any tasks you decide to design.

To further this thinking consider investigating _serverless_ or _function_ implementations on Kubernetes. In many ways Jobs are a primitive form of what various serverless solution achieve as _functions_. Take a look at [Knative](https://github.com/knative/) based solutions to understand how you may someday want to evolve your _Jobs_ into _Functions_.

## Lessons Learned ##

With these steps you have learned:

- &#x2714; how Jobs are defined and work in Kubernetes,
- &#x2714; how Kubernetes resilience recovers failed jobs,
- &#x2714; how Job can serially or in parallel,
- &#x2714; why it's more efficient to run Jobs in parallel,
- &#x2714; how Jobs can process a work queue.

## References ##

- [Book: Kubernetes Up & Running](http://shop.oreilly.com/product/0636920043874.do[])
- [Jobs](
https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/)
- [CronJobs](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/)
- [Kubernetes Up and Running Demo (kuard) App](https://github.com/kubernetes-up-and-running/kuard)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>

