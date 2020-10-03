In this section, we will deploy a database container with additional configuration options. The container requires a number of parameters to be passed to oc new-app. Let's create a simple mariadb container as shown here.

First delete objects created previously:
`oc delete all --all`{{execute}}

Now we want to create a database container where the database user named openshift is allowed to connect to the database named openshift. For simplicity reasons, we will use openshift as the database password. The following example, shows how to start a MariaDB container:

`oc new-app -e MYSQL_USER=openshift -e MYSQL_PASSWORD=openshift \
-e MYSQL_DATABASE=openshift mariadb`{{execute}}


Run `oc status`{{execute}} to view your app.

Verify mariadb is up and running:
`oc get all`{{execute}}


**Note:** Please wait for mariadb pod to be running before running exec command.

Now login to the container using oc exec:
`oc exec -it <mariadb-pod-name> /bin/bash`{{copy}}


Connect to mariadb database and verify that database named openshift is created and you have access to it running show databases command.

`mysql -uopenshift -popenshift -h127.0.0.1 openshift`{{execute}}

`show databases;`{{execute}}

```
+--------------------+
| Database |
+--------------------+
| information_schema |
| openshift |
| test |
+--------------------+
```

You can first exit database and then container by running following:

`exit`{{execute}}

`exit`{{execute}}


Clear out your lab environment.

`oc delete all --all`{{execute}}

`oc delete project simpleapplication`{{execute}}