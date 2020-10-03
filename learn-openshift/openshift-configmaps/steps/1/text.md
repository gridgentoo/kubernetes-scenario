Before we begin, make sure that your OpenShift is up and running. Run the folowing command to login to the OpenShift cluster

Login as system:admin:
`oc login -u system:admin`{{execute}}

Next, we will need to run the following command:
`oc adm policy add-scc-to-user anyuid -z default`{{execute}}


**Note:** We have not discussed the concept behind the command above yet,  it relaxes permissions imposed by OpenShift on pods. The concept is known as Security Context Constraint (SCC) and is discussed more thoroughly in security context scenario.