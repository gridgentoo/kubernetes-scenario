The SonarQube service is exposed as a NodePort but at a random value. This chart does not allow the NodePort value to be assigned. For Katacode to offer a URL to the service, the NodePort must adjusted to a known number, 31111. A workaround is to apply a patch to the port value.

`kubectl patch service sonar-sonarqube -n sonarqube --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

View the SonarQube dashboard here: [SonarQube Dashboard](
https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/).

You can logcin as admin / admin and view the pre-installed select plugins.

Notice the dashboard reports the number of analyzed projects is zero. With SonarQube running it's now ready to analyze a project.
