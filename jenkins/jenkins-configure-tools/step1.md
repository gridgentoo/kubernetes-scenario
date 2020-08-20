### Configure Jenkins

After the Jenkins installation, you can configure few other settings to complete the installation before creating jobs.
You will be setting JDK HOME and Maven Installation directory.

By default, Jenkins will build Java applications using whatever version of Java it finds on the system path, which is usually the version that Jenkins itself is running under. However, for a production build server, you will probably want more control than this. For example, you may be running your Jenkins server under Java 6, for performance reasons. However, your production server might be running under Java 5 or even Java 1.4. Large organizations are often cautious when it comes to upgrading Java versions in their production environments, and some of the more heavyweight application servers on the market are notoriously slow to be certified with the latest JDKs.

It is always a wise practice to build your application using a version of Java that is close to the one running on your production server. While an application compiled with Java 1.4 will usually run fine under Java 6, the inverse is not always true. Or you may have different applications that need to be built using different versions of Java.

Click Manage Jenkins, and then Configure System. If there is more than 1 JDK avaialable, you will see something like the following:

![image](https://user-images.githubusercontent.com/558905/37561595-9284e21a-2a28-11e8-97ee-d53936434b81.png)

Then, scroll down and find the **JDK** section, Click Add JDK.

Enter `OracleJDK` for JDK name.

Now check the **Install automatically** option. If unchecked then check it.

I agree to the Java SE Development Kit License Agreement

Now click the prompt to enter a user name and password, and enter:

Email: info@virtuant.com

Password: kAtAcodA1

Click `Save`, then `Close`.
