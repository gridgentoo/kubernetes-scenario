Environment variables adjust settings for a single container. The same approach can be used to start a multi-tier application where one container or application works alongside the other:


#### Multi-tier application example

In a multi-tier application, both the application server container and database server container may need to share variables such as database login credentials. Of course, we can pass all database connectivity settings to the application container using environment variables. It is very easy to make a mistake while passing multiple -e options to the docker run command, and it is very time-consuming, not to mention that it is very ineffective. Another option is to use container IP addresses to establish connections. We can gather IP address information using docker inspect but it will be difficult to track this information in a multi-container environment.

This means that using environment variables is just not enough to build multi-tier applications where containers depend on each other.

Docker has a featured called linked containers to solve this problem. It automatically copies all environment variables from one container to another. Additionally, by linking containers, we can define environment variables based on the other container's IP address and exposed ports.

Using linked containers is done by simply adding the --link container:alias option to the docker run command. For example, the following command links to a container named MariaDB using the DB alias:

`docker run -d --link mariadb:db --name my_application  httpd`{{execute}}

The new my_application container will then get all variables defined from the linked container mariadb. Those variable names are prefixed by DB_ENV_ so as not to conflict with the new container's own environment variables.


Let's take an example. We will be creating a WordPress container which needs access to a database server. This integration will require shared database access credentials. The first step in creating this application is to create a database server:
`docker rm -f $(docker ps -qa)`{{execute}}

`docker run -d --name mariadb -e MYSQL_ROOT_PASSWORD=wordpress -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=password mariadb`{{execute}}