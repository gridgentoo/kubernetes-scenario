# Initialization script
docker run -d -u root --rm --name jenkins -p 8080:8080 -p 50000:50000 --entrypoint bash jenkins:2.46.2-alpine -c "tail -F /jenkins.log"
docker exec -d jenkins bash -c 'git clone https://github.com/oveits/jenkins_home_alpine  && \
export JENKINS_HOME=$(pwd)/jenkins_home_alpine  && \
java -jar /usr/share/jenkins/jenkins.war 2>&1 1>/jenkins.log'
