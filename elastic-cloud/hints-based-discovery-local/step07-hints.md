### Update the hello-java metadata

`colordiff -U6 /root/course/hello-java.yaml /root/course/hello-java-hints.yaml`{{execute HOST1}}

`kubectl apply -f /root/course/hello-java-hints.yaml `{{execute HOST1}}

### Look at the changes in Kibana
At this point you will see that the multi-line pattern annotation has been applied and the logs look as you would like. Coming from Ops, I appreciate not having to have someone with a cluster admin role stop the agent, modify the config, and restart it.  Using these annotations puts the control of what gets collected in the hands of the application owner.  Just update the manifest and apply.

### View in Kibana

Open your Kibana URL and look under the Dashboard link, verify that the Apache and Redis dashboards are populating.

