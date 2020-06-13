## Persistent Volume ##

SonarQube will be making two PersistentVolumeClaims, one for SonarQube and one for the Postgres database. A PersistentVolume will be needed for each. Since this is all temporary in Katacoda, a [hostPath based PersistentVolume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume) is created for both.

`mkdir -p /mnt/data/postgres && kubectl create -f pv-postgres.yaml`{{execute}}

`mkdir -p /mnt/data/sonarqube && kubectl create -f pv-sonarqube.yaml`{{execute}}

## Install ##

Create a namespace for the installation target.

`kubectl create namespace sonarqube`{{execute}}

Using Helm, install the SonarQube Helm chart with a few custom values.

`helm install sonar stable/sonarqube --namespace sonarqube --values sonarqube-values.yaml`{{execute}}

This chart bootstraps a SonarQube instance along with a PostgreSQL database. SonarQube also loads several plugins defined in the Helm chart configuration. To get a complete status of the deployment availability run this inspection.

`watch kubectl get deployments,pods,services --namespace sonarqube`{{execute}}

Once complete, the Pods will move to the _running_ state. The `deployment.extensions/sonar-sonarqube` deployment may take 2-3 minutes before it reports `Available'. The behavior of the plugins can affect startup time. All the Deployments will eventually move to the _Available (1)_ state. Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.