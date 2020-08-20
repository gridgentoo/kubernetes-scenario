### Visualize the CheckStyle Warnings and Errors to the Developer

Usually Jenkins is not running as a Docker container on the Developer’s PC or Notebook, so he has no access to the above report files. We need to publish the statistics via the Jenkins portal. For that, we need to install the CheckStyle Jenkins plugin:

#### (optional): Install the “Static Analysis Utilities”

>Note: I have not tried it out, but I believe that this step is not necessary, since the next step will automatically install all plugins the Checksytle plug-in depends on.

On Jenkins -> Manage Jenkins -> Manage Plugins -> Available

In the Filter field, type “Static Analysis U”

![2016-12-28-22_44_53-update-center-jenkins](https://user-images.githubusercontent.com/558905/38052018-ee0161c2-329d-11e8-94ac-868da5a0d0b2.png)

Check the checkbox of “Static Analysis Utilities” and Install without restart.

![2016-12-28-22_47_06-update-center-jenkins](https://user-images.githubusercontent.com/558905/38052008-ed296fce-329d-11e8-99ec-248d7f5129a6.png)


#### Install Checkstyle Plugin

On Jenkins -> Manage Jenkins -> Manage Plugins -> Available

In the Filter field, type “Checkstyle ” (with white space at the end; this will limit the number of hits):

![2016-12-28-22_56_26-update-center-jenkins](https://user-images.githubusercontent.com/558905/38052772-4df0e47a-32a0-11e8-852c-1cd374b03f05.png)


Check the checkbox of “Checkstyle Plug-in” and Install without restart.

![2016-12-28-22_58_22-update-center-jenkins](https://user-images.githubusercontent.com/558905/38052774-4dfef3bc-32a0-11e8-99b7-bf99a89a5719.png)

#### Configure Checkstyle Reporting in Jenkins

On Dashboard -> <your Project> -> Configure -> Post-build Actions -> Add post-build action, choose

Publish Checkstyle analysis results

Now add the path, where Gradle is placing its result xml files:

**/build/reports/checkstyle/*.xml

![2016-12-28-23_10_57-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/38052777-4e57a35e-32a0-11e8-97bb-ac5aa8f7741d.png)

And click Save.

#### Manually Trigger a New Build

On the Project page, click “Build now”, then click on the build and then “Console output”:

![2016-12-28-23_17_16-github-triggered-build-726-console-jenki](https://user-images.githubusercontent.com/558905/38052778-4e8652f8-32a0-11e8-932d-c7f8ca8c5930.png)


We now can see [CHECKSTYLE] messages after the build, telling us, that the reports were collected. Now, where can we see them?

#### Review Checkstyle Statistics

On the Project page, choose Status:

![2016-12-28-23_20_31-github-triggered-build-726-jenkins-v21](https://user-images.githubusercontent.com/558905/38052779-4ebc99bc-32a0-11e8-8ec7-bfad354f66e6.png)


and click on Checkstyle Warnings on the left, or the warnings link in the center of the page, and we get a graphical representation of the Checkstyle statistics:

![2016-12-29-12_27_34-jenkins](https://user-images.githubusercontent.com/558905/38052784-4f1bfefc-32a0-11e8-891d-3f366be5b01b.png)

When clicking on one of the File Links (MyRouteBuilder.java in this case), we can get an overview of the Warning types for this file:

![2016-12-29-12_28_37-jenkins](https://user-images.githubusercontent.com/558905/38052785-4f31518a-32a0-11e8-9cce-2ad6275b7698.png)

We choose the category Indentation and get details on the warnings:

![2016-12-29-09_03_58-jenkins](https://user-images.githubusercontent.com/558905/38052780-4ec997a2-32a0-11e8-8507-8a6e054e634c.png)

and after clicking on one of the links in the Warnings field, we see the java code causing the warning:

![2016-12-29-09_05_56-jenkins](https://user-images.githubusercontent.com/558905/38052781-4ee425a4-32a0-11e8-9237-6b22c30a222c.png)

Okay, Camel’s Checkstyle configuration does not like my style of grouping each route’s first line with a smaller indent than the rest of the route:

![2016-12-29-09_10_26-jenkins](https://user-images.githubusercontent.com/558905/38052782-4ef75fc0-32a0-11e8-9e49-09c8d6d78564.png)

And it does not seem to accept my style of putting the ; in a new line at the end of a route as seen by choosing the Whitespace category and then choosing an occurence:

![2016-12-29-12_34_10-jenkins](https://user-images.githubusercontent.com/558905/38052786-4f4421b6-32a0-11e8-8c40-8b805a09a77e.png)

I either need to change this style, or I need to adapte the checkstyle.xml configuration file to ignore those warnings.
