You may have to wait a few minutes until your container is set up. Go to the Dashboard and Jenkins will be up in a few. No login needed.

If you later prefer to use Maven instead of (or in addition to) Gradle, you need to prepare its first usage. For Gradle preparation, after going to the menu pic, see the Gradle Alternative below.

1\. First, go to **Manage Jenkins -> Global Tool Configuration** (available for Jenkins >2.0):

![2016-12-09-11_34_55-manage-jenkins-jenkins](https://user-images.githubusercontent.com/558905/37997763-ff645992-31e9-11e8-815e-cb8f28e43f9b.png)

#### Alternative: Prepare Maven Usage

1\. Scroll down to **Maven -> Add Maven**

![2017-01-02-14_32_46-global-tool-configuration-jenkins](https://user-images.githubusercontent.com/558905/37997310-7e44e76a-31e8-11e8-8cfd-0b260a84995c.png)

2\. Add a name that indicates the version used (“Maven 3.5.0” in this case)

3\. Once you are finished, click **Save**.

Since we have checked “Install automatically” above, I expect that it will be installed automatically on first usage.

----

#### Alternative: Prepare Gradle Usage

1\. Scroll down to **Gradle -> Add Gradle**

![2016-12-09-11_35_26-global-tool-configuration-jenkins](https://user-images.githubusercontent.com/558905/37997254-612332b8-31e8-11e8-8317-76bbaa291e3c.png)


![2017-01-02-14_27_26-global-tool-configuration-jenkins](https://user-images.githubusercontent.com/558905/37997309-7e37eab0-31e8-11e8-9398-1b12e6fecffc.png)

2\. Add a name that indicates the version used (“Gradle 3.2.1” in this case)

3\. Now, click **Save** before moving to the next step.

Since we have checked “Install automatically” above, I expect that it will be installed automatically on first usage.
