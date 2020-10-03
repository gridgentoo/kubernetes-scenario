Use the following code to clean everything up.
`oc delete all --all`{{execute}}

```
deploymentconfig "wordpress" deleted
deploymentconfig "wordpress-db" deleted
buildconfig "wordpress" deleted
imagestream "wordpress-img" deleted
route "wordpress" deleted
pod "wordpress-1-tnvhl" deleted
pod "wordpress-db-1-pdsbb" deleted
service "wordpress" deleted
service "wordpress-db" deleted
```

`oc delete project wp`{{execute}}

```
project "wp" deleted
```
