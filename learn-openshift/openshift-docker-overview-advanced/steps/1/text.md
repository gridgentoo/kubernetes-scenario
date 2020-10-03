Due to the dynamic and stateless nature of containers, applications cannot rely on either fixed IP addresses or DNS hostnames while communicating with middleware and other application services. Docker lets you store data such as configuration settings, encryption keys, and external resource addresses in environment variables.

#### Passing environment variables to a container
Environment variables are used to set specific application parameters, like IP addresses, for a server to connect the database server address with login credentials.

Some container startup scripts use environment variables to perform the initial configuration of an application.

#### MariaDB
For example, a mariadb image is created to use several environment variables to start a container and create users/databases at the start time. This image uses the following important parameters, among others:


Parameter | Description
--- | ---
`MYSQL_ROOT_PASSWORD` | *This variable is mandatory and specifies the password that will be set for the MariaDB root superuser account.*
`MYSQL_DATABASE` | *This variable is optional and allows you to specify the name of a database to be created on image startup.*
`MYSQL_USER and MYSQL_PASSWORD` | *These variables are optional and used in conjunction to create a new user and to set that user's password. This user will be granted superuser permissions for the database specified by the MYSQL_DATABASE variable. Both variables are required for a user to be created.*


First, we can try to pull and start a mariadb container without specifying the password/user/database-related information. It will fail since the image expects the parameters. In this example, we are starting a container in the foreground to be able to see all error messages:
`docker pull mariadb`{{execute}}

Now try to run mariadb container without any options and arguments.
`docker run mariadb`{{execute}}

```
error: database is uninitialized and password option is not specified
```

You need to specify one of `MYSQL_ROOT_PASSWORD`, `MYSQL_ALLOW_EMPTY_PASSWORD` and `MYSQL_RANDOM_ROOT_PASSWORD`

The docker run command failed because the MariaDB image initial startup script was not able to find the required variables. This script expects us to have at least the MariaDB root password to start a database server. 