Let's go back to the original command you ran.

`kubectl get --raw /`{{execute}}

Notice there are duplicate paths that vary only by the version. Kubernetes supports multiple versions of APIs. The resources behind these API paths are not versioned. Only the APIs, not the resources, are versioned quite intentionally.

There is another way to get a consolidated list of versions.

`kubectl api-versions`{{execute}}

These are all the versions behind the API root path `/apis/`. In the version list most of the lines are composed of two parts separated with a slash (/). The left token is the API Group and the right side is the version in that group. Such as

`batch/v1` and `batch/v1beta`

If you look back at the api-resource you will notice two resources appeared in that `batch` API Group.

`kubectl api-resources | grep jobs`{{execute}}

Notice CronJobs and Jobs appear in this list. This means you can use the api-resource of `batch/v1` or `batch/v1beta` if those are both listed as versions for batch.

This means that when you define a Job then you can declare either of these for a Job definition.

```
apiVersion: batch/v1
kind: Job
```
or
```
apiVersion: batch/v1beta
kind: Job
```

At the end of the version list there is a simple line of `v1`. This is the version for all the other core resources that are not part of a API group, like a Pod.

```
apiVersion: v1
kind: Pod
```

As new versions are Kubernetes are rolled out these old versions like beta and alpha will be deprecated and eventually be removed. When upgrading to new versions of Kubernetes, a review of your resource versions should be understood to assess the update impact.
