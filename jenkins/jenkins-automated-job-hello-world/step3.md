### Test Manually Triggered Build

1\. Choose **Build Now** from the menu. We also can trigger a build manually via **Jenkins -> drop-down right of “GitHub Triggered Build” -> Build Now**.

![2016-12-09-11_46_03-dashboard-jenkins](https://user-images.githubusercontent.com/558905/37997255-612f5cb4-31e8-11e8-9b68-33a69cef4ee2.png)

2\. Click on **#1** of the build history:

![2017-01-02-14_59_15-github-triggered-build-jenkins-v2](https://user-images.githubusercontent.com/558905/37997312-7e763054-31e8-11e8-8c91-8badaba0e606.png)

3\. Then, on **Console Output**:

![2017-01-02-15_02_46-github-triggered-build-1-jenkins-v2](https://user-images.githubusercontent.com/558905/37997313-7e84dc76-31e8-11e8-9663-fbded1ae4aa4.png)

4\. We can observe the console output e.g. by clicking on the build link in the build history, then clicking **Console**

#### Alternative Maven:

![2017-01-03-14_05_03-github-triggered-build-4-console-jenkins](https://user-images.githubusercontent.com/558905/37997324-7f03fca4-31e8-11e8-9708-7229e7f6a322.png)

This may take a while (8+ mins in my case, with a 100Mbps connection):

![2017-01-03-14_42_22-github-triggered-build-4-console-jenkins](https://user-images.githubusercontent.com/558905/37997325-7f110e9e-31e8-11e8-96b5-a2dab68f1e2b.png)

By scrolling to the bottom of the output we can see in the output, that the JAR file was placed to:

`/jenkins_home_alpine/workspace/Github Triggered/Build/target/camel-spring4-0.0.1-SNAPSHOT.jar`

>Note: The path details may defer from that of the above example.

Remember this path and file from the above screen. We'll use it on the next page.

Great! This was the first successful Jenkins triggered Git download and Maven build.

#### Alternative Gradle

![2017-01-02-15_04_25-github-triggered-build-1-console-jenkins](https://user-images.githubusercontent.com/558905/37997314-7e955236-31e8-11e8-8f25-6bb3c793d86d.png)

This may take a while (~11 min in my case with a 100Mbps connection):

![2017-01-02-15_48_17-github-triggered-build-1-console-jenkins](https://user-images.githubusercontent.com/558905/37997315-7ea48620-31e8-11e8-95e5-b0b7204e78c4.png)

And that, was the first successful Jenkins triggered Git download and Gradle build. Great job!

#### Optional: Measure Time Consumption for Gradle clean Build

1\. Let us test again, whether the build is quicker the second time:

**Click -> Back to Project -> Configure**

2\. Add **clean** Gradle task before **jar** Gradle task:

![2017-01-02-16_00_27-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997316-7eb44cd6-31e8-11e8-9894-9e52074144f8.png)

3\. **Click -> Save -> Build Now**

4\. Then click **Build History -> current build**

5\. Then -> **Console Output**

6\. **Clean Build - Console Output**

This is showing that a clean build takes only ~6.4 sec, if all SW is downloaded already.

----

### Check on History

1\. Go back up to the top-level Jenkins menu. Check on the lifecycle of your build:

![image](https://user-images.githubusercontent.com/558905/38007181-2025b5aa-3216-11e8-8bba-f9e84e7ab690.png)
