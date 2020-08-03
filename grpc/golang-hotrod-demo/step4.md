With cars requested by the application, tracing output will have been generated and stored within Jaeger.

View the Jaeger dashboard at https://[[HOST_SUBDOMAIN]]-16686-[[KATACODA_HOST]].environments.katacoda.com/

Under the Find Traces caption, the Services dropdown contains the names of the services we saw in the dependency diagram. 

The **frontend** is the root service, choose this from the list and select **Find Traces**.

The system found one trace and displayed some meta-data about it, such as the names of different services that participated in the trace, and the number of spans each service emitted to Jaeger. The top level endpoint name is displayed in the title bar: HTTP GET /dispatch.

In the next step we'll explain the timeline view.
