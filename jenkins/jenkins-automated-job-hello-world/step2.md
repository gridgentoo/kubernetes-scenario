
### Create a Job

#### Download GitHub Plugin
You are going to need the GitHub plugin again, like before. Begin by navigating to the

1\. Like you've done before, navigate to the **Manage Jenkins** page from the home page. The page will look, like this:

<img width="905" alt="manage-jenkins-page" src="https://user-images.githubusercontent.com/21102559/39327134-1e19bc6e-4965-11e8-8c07-66db8a93f0d4.png">

2\. Now, as you've also done before, scroll down the page, locate the **Manage Plugins** hyperlink and click it.

<img width="376" alt="manage-plugins-hyperlink" src="https://user-images.githubusercontent.com/21102559/39327163-3761ef16-4965-11e8-9a20-f6d343c74130.png">

3\. Once you're on the managing plugins page, type **GitHub** into the filter search bar and press the appropriate button to begin the search.

<img width="318" alt="filter-github" src="https://user-images.githubusercontent.com/21102559/39327111-0e161696-4965-11e8-92b4-91276ce0ac34.png">

4\. From there, again, scroll down the page, locate the correct plugin and check its box. There are a lot of GitHub related plugins, so look before and make sure you verify it before installing it:

<img width="892" alt="check-github-plugin" src="https://user-images.githubusercontent.com/21102559/39327039-ce0aa152-4964-11e8-8e98-21224a1534ec.png">

5\. Now, simply click, **Install without restart** and move to the next step, after the install is complete.

<img width="254" alt="github-plugin-install-success" src="https://user-images.githubusercontent.com/21102559/39327769-06c2edfe-4967-11e8-86f1-0f22e717b6b5.png">

Once that's complete click **Go back to the top page**, and move on to the next step!

#### Specify GitHub Project

1\. Now, either click on **Create new Jobs** or on New Item. Now enter an Item name (such as "Github Triggered Build") and click on **Freestyle Project** and **OK**:

![2016-12-09-10_55_56-new-item-jenkins](https://user-images.githubusercontent.com/558905/37997764-ff732eb8-31e9-11e8-943e-9263e6e27c44.png)

2\. Check **GitHub project** and add the **HTTPS GitHub URL**. I have used a small project of mine that provides a simple restful file storage, and you can to: https://github.com/oveits/simple-restful-file-storage

![2016-12-09-11_02_22-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997765-ff827f76-31e9-11e8-9d34-a2df72fae369.png)

#### Configure Source Code Management

1\. Under **Source Code Management**, we choose **Git** and specify the GitHub repository a second time. If it is public, we do not enter the credentials for now:

![2016-12-09-14_53_46-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997252-61087310-31e8-11e8-8429-203e9eba9a46.png)

2\. Click **Apply** and proceed to the next step.

#### Configure Build Triggers

For now, we will test only manual “build now” triggers, so we do not need to specify any build triggers. Build triggers will be tested in the next stage. You can either build with Maven or Gradle. If you prefer to build via Gradle, go to the Alternative below.

#### Alternative: Configure Maven Build

Here, we show how to build the project via Maven. If you prefer to build via Gradle, see the next section.

1\. Here, we scroll down to **“Build” -> click -> “Invoke top-level Maven Targets”**

![2017-01-03-13_52_27-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997322-7ee9d3ce-31e8-11e8-8723-0860b435c463.png)

2\. Choose the Maven version you previously did and specify the goal **package**:

![2017-01-03-14_00_05-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997323-7ef84c38-31e8-11e8-97c1-062f7b538e79.png)

>Note that keeping the (Default) Maven version will not work, as long as this Default has not been defined.

The Maven goal “package” will build our JAR file.

3\. Click **Save** at the bottom left.

#### Alternative: Configure Gradle Build

**Prerequisite:** For creation of an executable JAR, the file `build.gradle` in the project root directory must be prepared.

Here, we show how to build the project via Gradle.

1\. Here, we scroll down to **“Build” -> click “Invoke Gradle script”**

![2016-12-09-11_11_47-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997766-ff8f7226-31e9-11e8-99cb-5f1bd2cc4093.png)

2\. Choose the Gradle version we have prepared in Step 3 and add the task **jar**:

![2017-01-02-14_56_34-github-triggered-build-config-jenkins](https://user-images.githubusercontent.com/558905/37997311-7e53bde4-31e8-11e8-87cd-eb03fbb87127.png)

>Note that keeping the (Default) Gradle version will not work, as long as this Default has not been defined.

The Gradle task **jar** will create our executable JAR file.

3\. Click **Save** at the bottom left.
