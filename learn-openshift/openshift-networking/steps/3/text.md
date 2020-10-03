
One of the mechanisms for linking pods together. When you deploy a multi-container application on OpenShift, pods that provide certain environment variables for pods that consume them must be started first, so that the variables are configured correctly by OpenShift. 

If you deploy a 3-tier application consisting of a database, backend, and frontend, you will have to deploy the database first so that the backend pod picks up environment variables with the correct address and port for the database.

Pods can access each other's services directly via their IPs, but in a highly dynamic environment, where services may often be re-created, there is a need for a more stable solution. Aside from using environment variables, OpenShift provides its internal DNS, implemented via SkyDNS and dnsmasq for service discovery. This approach doesn't limit your deployment to a certain order and spares you the need to implement additional logic in your deployment strategy. Using OpenShift DNS, all applications can discover each other across the entire cluster via consistent names, which makes it possible for developers to rely on them when migrating to OpenShift. The only thing they need to do is agree with Operations on the names of the services.

DNS in OpenShift gives pods the ability to discover the following resources in OpenShift:

Name | Domain
--- | ---
`Services` | `<service>.<project>.svc.cluster.local`
`Endpoints` | `<service>.<project>.endpoints.cluster.local`
