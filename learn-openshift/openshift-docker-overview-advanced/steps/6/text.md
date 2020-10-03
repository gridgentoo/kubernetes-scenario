We are going to rerun the container and verify whether the previously created database persistent survived container removal and creation:
`docker run -d -v /mnt/data:/var/lib/mysql --name mariadb mariadb`{{execute}}

As you can see, the database with the name persistent is still here.
`docker exec -it mariadb mysql -uroot -ppassword -e "show databases;"`{{execute}}

Remove all the containers before you proceed to the next section: `docker rm -f $(docker ps -aq)`{{execute}}