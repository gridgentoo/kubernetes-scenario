## Install the Jenkins Cobertura Plugin

Make sure Jenkins is started. Since we configured as windows service it will be started every time you start the machine.

1\. Go to the Jenkins Dashboard, either by clicking the **Dashboard** button to the right of the "Terminal" button, or by clicking on the following link:

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/

2\. To install a new plugin, click **Manage Jenkins** on the left, just like in the past.

3\. Click on the **Manage Plugins** entry.

![image001](https://user-images.githubusercontent.com/558905/37434281-85a2ef1c-27b5-11e8-9f2e-8dbeb9d029db.png)

4\. Click on **Available** tab.

![image003](https://user-images.githubusercontent.com/558905/37434283-85c62342-27b5-11e8-8042-5bcc519415e2.png)

5\. Type **cobertura** in the **Filter** and then check the check-box next to **Cobertura Plugin**.

![image005](https://user-images.githubusercontent.com/558905/37434285-86196ee4-27b5-11e8-9b2e-39ee5465c748.jpg)

6\. Click on the **Download now and Install after restart button** at the bottom of the screen.

![image006](https://user-images.githubusercontent.com/558905/37434286-862f4bc4-27b5-11e8-972c-2c21f06c2196.png)

7\. Select the checkbox for **Restart Jenkins**....

![image007](https://user-images.githubusercontent.com/558905/37434287-8642954e-27b5-11e8-928a-9bd3ce2119ce.png)

>Note: At this point, Jenkins should restart itself. If it doesn't return to the main screen within a few minutes, you may need to use the **Services** portion of the **Windows Control Panel** to restart the service manually. Consult your instructor, in case of difficulty.

8\. Click **Back to Dashboard**.
