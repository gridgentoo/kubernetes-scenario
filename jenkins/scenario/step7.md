After setting up, now you will be landed on Jenkins Dashboard.
Make yourself familiar with it.

Now, for our scenario, we have to set JDK & install Git plugin.

First, we will install **GIT Plugin** for Jenkins. To do that:

 + Click on **Manage Jenkins** from left menu.

 + Click on **Manage Plugins** on the next page.

 + Select **Available** tab from the Plugin Manager page.

 + Enter **Git Plugin** in the **Filter box** on the upper right side.

 + Check the box before **Git Plugin** 

 + Click on **Install without restart**

	
Jenkins will download & install selected plugin as well as its dependencies.

Once the download is complete & you see **Success** after each plugin, click on **Manage Plugins**

Now, the next thing to do is to set **JDK** which we will need to compile & execute our program. To do that:

 + Make sure you are on **Manage Jenkins** page.
 
 + Click on **Global Tool Configuration**
 
 + Click on **Add JDK**
 
 + Enter any name for JDK in the **JDK Name** text box.
 
 + Uncheck the **Install Automatically** checkbox.
 
 + Enter the path **/usr/lib/jvm/java-8-openjdk-amd64** in the **JAVA_HOME** text box.
  (You can get value of JAVA_HOME by logging into your container & entering **echo $JAVA_HOME**)
 
 + Click on **Apply**
 
 + Click on **Save**

That's it! You are done with the settings.


