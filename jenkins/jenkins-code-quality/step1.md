### Code Analysis: Checkstyle

With Gradle, we can invoke the Checkstyle plugin as follows:

#### Prepare Gradle for Performing Checkstyle

<pre class="file" data-filename="build.gradle" data-target="replace"><blockquote>
apply plugin: 'checkstyle'

tasks.withType(Checkstyle) {
 ignoreFailures = true
 reports {
 html.enabled = true
 }
}
</blockquote></pre>

We have set ignoreFailures to true, since we do not want the Gradle build to fail for now. We are just interested in the Checkstyle reports for now.

We can download an example Checkstyle configuration file from the Apache Camel repository, for example:

```
git clone <yourprojectURL>
mkdir -p <yourprojectDir>/config/checkstyle/
curl https://raw.githubusercontent.com/apache/camel/master/buildingtools/src/main/resources/camel-checkstyle.xml > <yourprojectDir>/config/checkstyle/checkstyle.xml
```

#### (optional): Test Checkstyle locally

If you have no Git and/or no Gradle installed, you may want to skip this step and directly proceed to the next step, so Jenkins is performing this task for you.

We can locally invoke CheckStyle as follows:

`gradle check`{{execute}}

#### Configure Jenkins to invoke Checkstyle

Adding Gradle Checkstyle tests to be performed before each build is as simple as performing this and then adding “check” as a goal to the list of Jenkins **Build Gradle** Tasks:

On Dashboard -> Click on Project name -> Configure -> Build, add “check” before the jar task:

![2016-12-28-15_33_58-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/38052009-ed39b58c-329d-11e8-9b38-0a6fbf8e7e3c.png)

Click Save.

Now we verify the setting by either checking changed code into the SW repository (now is a good time to commit and push the changes performed in Step 4.1) or by clicking “Build now” -> Click on Build Link in Build History -> Console Output in the Project home:

![2016-12-28-15_39_37-github-triggered-build-725-console-jenki](https://user-images.githubusercontent.com/558905/38052010-ed48593e-329d-11e8-809a-ac8325d15f90.png)


![2016-12-28-15_40_08-github-triggered-build-725-console-jenki](https://user-images.githubusercontent.com/558905/38052013-ed832154-329d-11e8-877b-d1e0aa71d0f7.png)

We have received a very long list of CheckStyle Errors, but, as configured, the build does not fail nevertheless.

At the same time, CheckStyle Reports should be available on Jenkins now:

The Links specified in the output are only available on Jenkins, but since Jenkins is running as a Docker container on Vagrant VM residing in a directory like:

`D:\veits\Vagrant\ubuntu-trusty64-docker_openshift-installer\jenkins_home`

I need to access the files on

file:///D:/veits/Vagrant/ubuntu-trusty64-docker_openshift-installer/jenkins_home/workspace/GitHub%20Triggered%20Build/build/reports/checkstyle/


![2016-12-28-15_48_11-index-von-d__veits_vagrant_ubuntu-trusty](https://user-images.githubusercontent.com/558905/38052015-edc0513c-329d-11e8-8df2-136a308eab49.png)


And on main.html we find:

![2016-12-28-15_49_04-main-html](https://user-images.githubusercontent.com/558905/38052017-edde386e-329d-11e8-9120-f29446c18c7c.png)

Wow, it seems like I really need to clean the code…
