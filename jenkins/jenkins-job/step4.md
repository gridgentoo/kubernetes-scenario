
So far, we have created a Jenkins job that pulls a fresh copy of the source tree prior to building. But we triggered the build manually. In most cases, we would like to have the build triggered automatically whenever a developer makes changes to the source code in the version control system.

In the Jenkins web application, navigate to the SimpleGreeting project. You can probably find the project in the breadcrumb trail near the top of the window. Alternately, go to the Jenkins home page and then click on the project.

Click the Configure link.

Scroll down to find the Build Triggers section.

![image045](https://user-images.githubusercontent.com/558905/37422398-79e04f2c-2791-11e8-9976-96e74afd3182.jpg)

Click on the checkbox next to Poll SCM, and then enter '* * * * *' into the Schedule text box. [Make sure there is an space between each *]

>Note: The above schedule sets up a poll every minute. In a production scenario, that's a higher frequency than we need, and it can cause unnecessary load on the repository server and on the Jenkins server. You'll probably want to use a more reasonable schedule - perhaps every 15 minutes. That would be 'H/15 * * * *' in the schedule box.

Click Save.
