We now have a configured Pipeline job that will build our hello world software from Github. The next stage is to test and try it.

#### Task: Build
1. On the left-hand side, select **Build Now**. You should see that the pipeline is starting.


![Starting Pipeline](https://oliverveits.files.wordpress.com/2017/05/2017-05-12-12_10_22-pipeline-hello-world-jenkins.png)

You can click on the Pipeline field, and you are offered to view the logs:

![Logs](https://oliverveits.files.wordpress.com/2017/05/2017-05-12-12_21_34-pipeline-hello-world-jenkins.png)

You will see, that there are some downloads running in the background, when running the build the first time:

![Downloads in the Log](https://oliverveits.files.wordpress.com/2017/05/2017-05-12-12_23_15-pipeline-hello-world-jenkins.png)

2. Repeat the **Build Now** several times. 

Some of the builds will be shown in green (stable), some will be shown in yellow (unstable). This comes from the fact, that the sample project we have chosen randomly throws errors, so we will get a nice Test Trend graph.

3. If you have started Jenkins in a separate Window or tab, reload the page or press F5. In the dashboard, you need to click on the Job name "Pipeline Hello World" instead. 

Now a Test Result Trend will be shown:

![Jenkins Pipeline Dashboard with Test Result Trend](https://oliverveits.files.wordpress.com/2017/05/2017-05-12-10_53_17-pipeline-hello-world-jenkins.png)

SUCCESS!
