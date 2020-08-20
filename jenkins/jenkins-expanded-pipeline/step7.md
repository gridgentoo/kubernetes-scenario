Now let's see how to deploy our war file into a docker container.


For the deployment to Docker, we’re going to add a new stage as always. But we’ll do a couple of things differently up front in our stage.

We’ll pull down the input files for Docker to use in building the images from a Git repository on the system.
We’ll run the processes on a different node so we don’t overwrite the workspace we already have on worker_node1.
We want to deploy the latest artifact (war file) into the container that we are spinning up. So we can use the unstash command on the stash that we created at the end of the Retrieve Latest Artifact stage.

To handle this, start out by adding the following lines in bold to your pipeline. (These go after the Retrieve Latest Artifact stage and before the ending bracket.)
 
 

The remaining steps in this process use a combination of shell commands driving Docker and the built-in Docker variable to

Clean out any old images and containers
Build images from Dockerfiles in our git repository. There are two images – one for the webapp (which pulls in the war) and one for the database piece.
Start up and link together containers for each image. This results in our app running under Docker.
Find (inspect) the container to get the ip address where it is running and display that so we can look at it.

The following lines in bold need to be added to the stage to complete it. But for simplicity and avoiding typos, it is recommended you copy and paste them from the file named Docker on the desktop. Either way add these lines in the Deploy to Docker stage .

stage('Deploy To Docker') { node ('worker_node3') {
git 'git@diyvb2:/home/git/repositories/roarv2-docker.git' unstash 'latest-warfile'

sh "docker stop `docker ps -a --format '{{.Names}} \n\n'` || true" sh "docker rm -f `docker ps -a --format '{{.Names}} \n\n'` || true"
sh "docker rmi -f \$(docker images | cut -d' ' -f1 | grep roar) || true"

def dbImage = docker.build("roar-db-image", "-f Dockerfile_roar_db_image .") def webImage = docker.build("roar-web-image", "--build-arg warFile=web*.war -f
Dockerfile_roar_web_image .")

def dbContainer = dbImage.run("-p 3308:3306 -e MYSQL_DATABASE='registry' -e MYSQL_ROOT_PASSWORD='root+1' -e MYSQL_USER='admin' -e MYSQL_PASSWORD='admin'")
def webContainer = webImage.run("--link ${dbContainer.id}:mysql -p 8089:8080")

sh "docker inspect --format '{{.Name}} is available at http://{{.NetworkSettings.IPAddress }}:8080/roar'
\$(docker ps -q -l)"
}
 
}
 
Save your changes and Build with Parameters. Once completed, you will have another stage in your pipeline.



Now, open the Console log for the last build of pipe1. Scroll down near the bottom of the console log and you should see the output of the Docker inspect command. It will look something like the figure below.

Click on the link after “is available at”. This is a link to our webapp running in the Docker container. The ip address/url is on the Docker container. Once you click on that you should see the webapp as its being run in Docker.

![image088](https://user-images.githubusercontent.com/558905/37634671-e41f1838-2bcd-11e8-92cd-ef8fb2f8faa3.gif)
![image090](https://user-images.githubusercontent.com/558905/37634672-e42df3bc-2bcd-11e8-983d-b91a913ee58e.png)
![image094](https://user-images.githubusercontent.com/558905/37634673-e441646a-2bcd-11e8-917e-46742c596786.png)
![image095](https://user-images.githubusercontent.com/558905/37634674-e450b3d4-2bcd-11e8-8239-06d90142d2c9.jpg)
![image096](https://user-images.githubusercontent.com/558905/37634675-e45e6740-2bcd-11e8-8621-b09cea7a267b.gif)
![image098](https://user-images.githubusercontent.com/558905/37634676-e470cf98-2bcd-11e8-81cf-a5885fe89cd4.jpg)
![image100](https://user-images.githubusercontent.com/558905/37634677-e486800e-2bcd-11e8-8727-5c36e0f07750.jpg)
![image101](https://user-images.githubusercontent.com/558905/37634678-e4977332-2bcd-11e8-86dc-60ff15a8966c.jpg)
![image104](https://user-images.githubusercontent.com/558905/37634679-e4ae8702-2bcd-11e8-9dea-065aed839afb.png)
![image106](https://user-images.githubusercontent.com/558905/37634680-e4bbfe1e-2bcd-11e8-9323-763bf932039f.png)
![image108](https://user-images.githubusercontent.com/558905/37634682-e4d278e2-2bcd-11e8-8bcc-e0a7fee631d3.gif)
![image109](https://user-images.githubusercontent.com/558905/37634683-e4e355fe-2bcd-11e8-8eb6-538e6a3d86f1.jpg)
![image111](https://user-images.githubusercontent.com/558905/37634684-e4f48586-2bcd-11e8-9d86-4243b1e1b9d2.gif)
![image113](https://user-images.githubusercontent.com/558905/37634685-e500c3e6-2bcd-11e8-9e3a-4ffa2f1011fd.gif)
![image114](https://user-images.githubusercontent.com/558905/37634686-e512efa8-2bcd-11e8-9932-0c9b10b3aebb.gif)
![image115](https://user-images.githubusercontent.com/558905/37634687-e52a0562-2bcd-11e8-8d19-9ac033fb93a7.gif)
![image116](https://user-images.githubusercontent.com/558905/37634689-e53c5a6e-2bcd-11e8-9239-0371224deeb5.gif)
![image117](https://user-images.githubusercontent.com/558905/37634691-e54f6244-2bcd-11e8-9c03-9d055e87d0bc.gif)
![image118](https://user-images.githubusercontent.com/558905/37634692-e56022be-2bcd-11e8-9def-69f152540dc0.gif)
![image119](https://user-images.githubusercontent.com/558905/37634693-e574fea0-2bcd-11e8-9082-d1c7f18a3268.gif)
![image122](https://user-images.githubusercontent.com/558905/37634694-e581c216-2bcd-11e8-8d72-c1c3dfb3e399.jpg)
![image124](https://user-images.githubusercontent.com/558905/37634695-e58dee4c-2bcd-11e8-9acd-72251c901251.png)
![image126](https://user-images.githubusercontent.com/558905/37634696-e59e7906-2bcd-11e8-9bde-159cd1ca07f5.gif)
![image127](https://user-images.githubusercontent.com/558905/37634697-e5b11980-2bcd-11e8-8349-b3ea8e750ed6.gif)
![image128](https://user-images.githubusercontent.com/558905/37634698-e5c2cf18-2bcd-11e8-9566-9c00505841af.jpg)
![image131](https://user-images.githubusercontent.com/558905/37634699-e5d211bc-2bcd-11e8-8312-00bbb20a01e5.jpg)
![image134](https://user-images.githubusercontent.com/558905/37634700-e5e199e8-2bcd-11e8-8afa-4d4da37d68ec.gif)
![image135](https://user-images.githubusercontent.com/558905/37634701-e5eee3e6-2bcd-11e8-9e45-497224d6582c.png)
![image136](https://user-images.githubusercontent.com/558905/37634702-e5fc3f00-2bcd-11e8-814a-9f790329071d.gif)
![image138](https://user-images.githubusercontent.com/558905/37634703-e60eaf0a-2bcd-11e8-99ff-c9da12165e52.jpg)
![image140](https://user-images.githubusercontent.com/558905/37634704-e62566f0-2bcd-11e8-8e7d-5d81de1afe56.jpg)
![image142](https://user-images.githubusercontent.com/558905/37634705-e636555a-2bcd-11e8-842b-68b7c031135c.png)
