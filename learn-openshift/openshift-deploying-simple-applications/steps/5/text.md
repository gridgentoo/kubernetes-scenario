The oc utility allows you to deploy a simple application in a user-friendly way. Generally, you just need to pass one or more options to the oc new-app command, which will then create all required resources, including pod(s) and service(s), for your application. Additionally, that command creates ReplicationController and DeploymentConfig API objects that control how your application is being deployed.

 
The oc new-app command
So,oc new-appcreates the following resources during application deployment from an existing Docker image:

Resource | Abbreviation | Description
--- | ---
`Pod` | *pod* | *Pod representing your container*
`Service:admin` | *svc* | *Service containing an internal application endpoint*
`ReplicationController` | *rc* | *A replication controller is an OpenShift object that controls the number of replicas for an application*
`DeploymentConfig` | *dc* | *Deployment configuration is a definition of your deployment*