> _Create a build and deployment config for Jenkins. Add new configuration and plugins to the OCP Stock Jenkins using s2i_

5. Add the Jenkins Build & Deployment configs to the `enablement-ci-cd` repo by merging the contents `exercise1/jenkins` in
```
git checkout exercise1/jenkins templates/jenkins.yml
```{{execute}}
The Jenkins template is essentially the standard persistent Jenkins one with OpenShift.

5. As before; create a new set of params by creating a `params/jenkins` file and adding some overrides to the template and updating the `<YOUR_NAME>` value accordingly.
```
MEMORY_LIMIT=3Gi
VOLUME_CAPACITY=10Gi
JVM_ARCH=x86_64
NAMESPACE=<YOUR_NAME>-ci-cd
JENKINS_OPTS=--sessionTimeout=720
```

5. Add a `jenkins` variable to the Ansible inventory underneath the jenkins-mongo (and git if you have it) in  `inventory/host_vars/ci-cd-tooling.yml`.
```yaml
    - name: "jenkins"
      namespace: "{{ ci_cd_namespace }}"
      template: "{{ playbook_dir }}/templates/jenkins.yml"
      params: "{{ playbook_dir }}/params/jenkins"
      tags:
      - jenkins
```
This configuration, if applied now, will create the deployment configuration needed for Jenkins but the `${NAMESPACE}:${JENKINS_IMAGE_STREAM_TAG}` in the template won't exist yet.

5. To create this image we will take the supported OpenShift Jenkins Image and bake into it some extra configuration using an [s2i](https://github.com/openshift/source-to-image) builder image. More information on Jenkins s2i is found on the [openshift/jenkins](https://github.com/openshift/jenkins#installing-using-s2i-build) GitHub page. To create an s2i configuration for Jenkins, check out the pre-canned configuration source in the `enablement-ci-cd` repo
```
git checkout exercise1/jenkins-s2i jenkins-s2i
```{{execute}}
The structure of the Jenkins s2i config is
```
jenkins-s2i
├── README.md
├── configuration
│   ├── build-failure-analyzer.xml
│   ├── init.groovy
│   ├── jenkins.plugins.slack.SlackNotifier.xml
│   ├── scriptApproval.xml
│   └── jobs
│       └── seed-multibranch-job
│           └── config.xml
└── plugins.txt
```
 * `plugins.txt` is a list of `pluginId:version` for Jenkins to pre-install when starting
 * `./configuration` contains content that is placed in `${JENKINS_HOME}`. A `config.xml` could be placed in here to control the bulk of Jenkins configuration.
 * `./configuration/jobs/*` contains job names and xml config that jenkins loads when starting. The seed job in there we will return to in later lessons.
 * `build-failure-analyzer.xml` is config for the plugin to read the logs and look for key items based on a Regex. More on this in later lessons.
 * `init.groovy` contains a collection of settings jenkins configures itself with when launching

5. Let's add a plugin for Jenkins to be started with, [green-balls](https://plugins.jenkins.io/greenballs). This simply changes the default `SUCCESS` status of Jenkins from Blue to Green. Append the `jenkins-s2i/plugins.txt` file with
```txt
greenballs:1.15
```
<img src="https://raw.githubusercontent.com/rht-labs/enablement-docs/master/exercises/images/exercise1/green-balls.png" alt="green-balls" width="600px"/>

Why does Jenkins have Blue Balls? More can be found [on reddit](https://www.reddit.com/r/programming/comments/4lu6q8/why_does_jenkins_have_blue_balls/) or the [jenkins blog](https://jenkins.io/blog/2012/03/13/why-does-jenkins-have-blue-balls/)

5. Before building and deploying the Jenkins s2i; add git credentials to it. These will be used by Jenkins to access the Git Repositories where our apps will be stored. We want Jenkins to be able to push tags to it so write access is required. There are a few ways we can do this; either adding them to the `template/jenkins.yml` as environment Variables and then including them in the `params/jenkins` file.  We could also create a token in GitLab and use it as the source secret in the Jenkins template.
But for simplicity just replace the `<USERNAME>` && `<PASSWORD>` in the `jenkins-s2i/configuration/init.groovy` with your LDAP credentials as seen below. This init file gets run when Jenkins launches and will setup the credentials for use in our Jobs in the next exercises
```groovy
gitUsername = System.getenv("GIT_USERNAME") ?: "<USERNAME>"
gitPassword = System.getenv("GIT_PASSWORD") ?: "<PASSWORD>"
```
<p class="tip">
Note in a residency we would not use your GitCredentials for pushing and pulling from Git, a service user would be created for this.
</p>

5. Checkout the params and the templates for the `jenkins-s2i`
```
git checkout exercise1/jenkins-s2i params/jenkins-s2i templates/jenkins-s2i.yml
```

5. Open `params/jenkins-s2i` and add the following content; replacing variables as appropriate.
```
SOURCE_REPOSITORY_URL=<GIT_URL>
NAME=jenkins
SOURCE_REPOSITORY_CONTEXT_DIR=jenkins-s2i
IMAGE_STREAM_NAMESPACE=<YOUR_NAME>-ci-cd
SOURCE_REPOSITORY_USERNAME=<YOUR_LDAP_USERNAME>
SOURCE_REPOSITORY_PASSWORD=<YOUR_LDAP_PASSWORD>
```
where
    * `<GIT_URL>` is the full clone path of the repo where this project is stored (including the https && .git)
    * `<YOUR_NAME>` is the prefix for your `-ci-cd` project.
    * Explore some of the other parameters in `templates/jenkins-s2i.yml`
    * `<YOUR_LDAP_USERNAME>` is the username builder pod will use to login and clone the repo with
    * `<YOUR_LDAP_PASSWORD>` is the password the builder pod will use to authenticate and clone the repo using
<p class="tip">
Note in a residency we would not use your GitCredentials for pushing and pulling from Git, A service user would be created or a token generated.
</p>

5. Create a new object `ci-cd-builds` in the Ansible `inventory/host_vars/ci-cd-tooling.yml` to drive the s2i build configuration.
```yaml
  - object: ci-cd-builds
      content:
      - name: "jenkins-s2i"
        namespace: "{{ ci_cd_namespace }}"
        template: "{{ playbook_dir }}/templates/jenkins-s2i.yml"
        params: "{{ playbook_dir }}/params/jenkins-s2i"
        tags:
        - jenkins
```

5. Commit your code to your GitLab instance
```
git add .
```{{execute}}
```
git commit -m "Adding Jenkins and Jenkins s2i"
```{{execute}}
```
git push
```{{execute}}

5.  In order for Jenkins to be able to run `npm` builds and installs we must configure a `jenkins-build-slave` for Jenkins to use. This slave will be dynamically provisioned when we run a build. It needs to have NodeJS and npm installed in it. These slaves can take a time to build themselves so to speed up we have placed the slave within OpenShift and you can use the following commands to be able to use them in your project.
```
oc project <YOUR_NAME>-ci-cd
```
```
oc tag openshift/jenkins-slave-npm:latest jenkins-slave-npm:latest
```{{execute}}
```
oc label is jenkins-slave-npm role=jenkins-slave
```{{execute}}
This is pulling the container image into your namespace and then adding a label which will allow Jenkins to take notice of it. Don't worry if the label is already there and this last command fails!

5. Now your code is commited, and you have bought in the Jenkins slave; run the OpenShift Applier to add the config to the cluster
```
ansible-playbook apply.yml -e target=tools \
     -i inventory/ \
     -e "filter_tags=jenkins"
```{{execute}}

5. This will trigger a build of the s2i and when it's complete it will add an imagestream of `<YOUR_NAME>-ci-cd/jenkins:latest` to the project. The Deployment config should kick in and deploy the image once it arrives. You can follow the build of the s2i by going to the OpenShift console's project
<img src="https://raw.githubusercontent.com/rht-labs/enablement-docs/master/exercises/images/exercise1/jenkins-s2i-log.png" alt="jenkins-s2i-log" width="600px"/>


5. When the Jenkins deployment has completed; login (using your OpenShift credentials) and accept the role permissions. You should now see a fairly empty Jenkins with just the seed job