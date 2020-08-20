We looked at how to build more resilience into the applications through scaling in the 
previous sections. In this section, you will learn how to recover application pods when 
failures happen. In fact, you don't need to do anything because OpenShift automatically 
recovers failed pods when pods are not feeling healthy. The healthiness of application pods is determined via the 
[health probes](https://docs.openshift.com/container-platform/3.7/dev_guide/application_health.html#container-health-checks-using-probes) 
which was discussed in the previous scenarios.

There are three auto-healing scenarios that OpenShift handles automatically:

* **Application Pod Temporary Failure** 

  When an application pod fails and does not pass its 
  [liveness health probe](https://docs.openshift.com/container-platform/3.7/dev_guide/application_health.html#container-health-checks-using-probes),  
  OpenShift restarts the pod in order to give the application a chance to recover and start functioning 
  again. Issues such as deadlocks, memory leaks, network disturbance and more are all examples of issues 
  than can most likely be resolved by restarting the application despite the potential bug remaining in the 
  application.

* **Application Pod Permanent Failure** 

  When an application pod fails and does not pass its 
  [readiness health probe](https://docs.openshift.com/container-platform/3.7/dev_guide/application_health.html#container-health-checks-using-probes), 
  it signals that the failure is more severe and restart does not help to mitigate the issue. OpenShift then 
  removes the application pod from the load-balancer to prevent sending traffic to it.

* **Application Pod Removal** 

  If an instance of the application pod get removed, OpenShift automatically 
  starts new identical application pods based on the same container image and configuration so that the 
  specified number of instances all running at all times. An example of a removed pod is when an entire 
  node (virtual or physical machine) crashes and is removed from the cluster.

OpenShift is quite orderly in this regard and if extra instances of the application pod would start running, 
it would kill the extra pods so that the number of running instances matches what is 
configured on the deployment config.