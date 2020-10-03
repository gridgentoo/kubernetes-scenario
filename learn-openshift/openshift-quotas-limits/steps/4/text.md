
This is another way of control resource allocation in OpenShift at the project level, but unlike ResourceQuotas, they are different in certain ways:

- They are applied to individual pods, containers, images, or image streams
- They don't control some resources such as secrets, ConfigMaps, ResourceQuotas, services, and ReplicationControllers
- They can be created from a raw definition only

Depending on the type of resource they are applied to, LimitRanges control various computing resources and objects:

Resource type | Computing resources
--- | ---
`Pod` | *<ul><li>CPU</li><li>RAM</li></ul>*
`Container` | *<ul><li>CPU</li><li>RAM</li></ul>*
`Image` | *Size of an image pushed into an internal registry.*
`ImageStream` | *<ul><li>Number of unique image tags as per image stream's spec</li><li>Number of unique image references as per the image stream's status</li></ul>*
`PersistentVolumeClaim` | *Amount of storage requested*
 


Pods and containers can explicitly state the amount of CPU and/or RAM they need and their limits, and LimitRanges takes care that they don't fall outside certain boundaries. Also, LimitRanges may provide defaults for a requested number of resources and their limits if they are not specified.

Depending on the presence of, and differences between, requests and limits for computing resources declared by pods, they run with different Quality of Service (QoS) tiers that serve the purpose of prioritizing running pods when it comes to resource contention. The following table summarizes the available tiers and when they are applied:

QoS tier | Description
--- | ---
`BestEffort` | *This tier is assigned to pods that don't specify requests and limits explicitly.*
`Burstable` | *They run with a lower priority than BestEffort pods.*
`Guaranteed` | *Each pod running with this QoS is entitled to the requested amount of resources, but no more.*
`NotTerminating` | *Applies to all pods deployed by jobs with spec.activeDeadlineSeconds is nil, which means the usual pods with applications.*
 

Just as in the previous section, setting LimitRanges requires administrative privileges, so make sure you are logged in as system:admin user:
`oc login -u system:admin`{{execute}}


Let's consider an example of creating a LimitRange from scratch:


<pre class="file" data-filename="my-limits.yaml" data-target="replace">

apiVersion: v1
kind: LimitRange
metadata:
  name: my-limits
spec:
  limits:
    - type: Pod
      min:
        cpu: 200m
        memory: 256Mi
      max:
        cpu: 400m
        memory: 512Mi
    - type: Container
      min:
        cpu: 100m
        memory: 128Mi
      max:
        cpu: 300m
        memory: 256Mi
</pre>


Create limits from the preceding definition:
`oc create -f my-limits.yaml`{{execute}}

Now, let's describe our newly created limits:
`oc describe limits/my-limits`{{execute}}


Note: There are also the spec.limits[].default and spec.limits[].defaultRequest parameters, which determine the amount of CPU/RAM a container is limited to use and the amount it requests by default, respectively. Since we didn't specify them explicitly, they default to the same maximum value.

