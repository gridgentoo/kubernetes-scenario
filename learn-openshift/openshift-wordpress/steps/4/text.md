Now using project "wp" in openshift".
First, since it is a new template for us, we want to gather some information regarding available parameters. As was previously described, oc process --parameters can be helpful:


`oc process --parameters -f  wordpress-quickstart/templates/classic-standalone.json`{{execute}}

```
NAME DESCRIPTION GENERATOR VALUE
APPLICATION_NAME The name of the WordPress instance.
QUICKSTART_REPOSITORY_URL The URL of the quickstart Git repository. https://github.com/openshift-evangelists/wordpress-quickstart
WORDPRESS_DEPLOYMENT_STRATEGY Type of the deployment strategy for Wordpress. Recreate
WORDPRESS_MEMORY_LIMIT Amount of memory available to WordPress. 512Mi
DATABASE_MEMORY_LIMIT Amount of memory available to the database. 512Mi
DATABASE_USERNAME The name of the database user. expression user[a-f0-9]{8}
DATABASE_PASSWORD The password for the database user. expression [a-zA-Z0-9]{12}
MYSQL_VERSION The version of the MySQL database. 5.7
PHP_VERSION The version of the PHP builder. 7.0
```

Notice that only most of the variables have a default value.