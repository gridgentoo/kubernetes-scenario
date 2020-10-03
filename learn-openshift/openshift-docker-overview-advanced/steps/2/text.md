Let's try to start a database container again by providing all required variables:
`docker run -d --name mariadb -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=example -e MYSQL_USER=example_user -e MYSQL_PASSWORD=password mariadb`{{execute}}

Run the docker ps command to verify that the container is up and running:
`docker ps`{{execute}}

The startup script created a user named example_user with the password password as we specified in the environment variables. It also configured a password for the root user.