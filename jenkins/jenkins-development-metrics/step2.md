In this section, we'll configure Jenkins to publish the Cobertura coverage report, and then we'll add coverage testing to the project itself.

Click on the job we created for SimpleGreeting.

![image009](https://user-images.githubusercontent.com/558905/37434290-86655aca-27b5-11e8-94d1-6a4459647b9f.jpg)

On the left-hand menu, click Configure.

Scroll down to the Post-Build Actions section.

![image010](https://user-images.githubusercontent.com/558905/37434291-86768e3a-27b5-11e8-97b5-fd4a505afbec.png)
![image011](https://user-images.githubusercontent.com/558905/37434292-868765a2-27b5-11e8-87fc-5ac2c37531f2.jpg)
![image012](https://user-images.githubusercontent.com/558905/37434293-869a4834-27b5-11e8-80c1-94b6d95896cd.png)
![image013](https://user-images.githubusercontent.com/558905/37434294-86b06b6e-27b5-11e8-86d7-a073a881e8a1.jpg)
![image014](https://user-images.githubusercontent.com/558905/37434295-86c0e2c8-27b5-11e8-946f-b2472b79f8ce.jpg)
![image015](https://user-images.githubusercontent.com/558905/37434296-86cab5aa-27b5-11e8-9361-77b5564b46af.jpg)


Click on the Add post-build action button and then select Publish Cobertura Coverage Report.

Enter the following for the Cobertura XML Report Pattern

**/target/site/cobertura/coverage.xml**

Scroll up to find the Build section.

In the Goals and Options text box, enter the following:

`clean install cobertura:cobertura`

Click Save.

You will see the project screen view and Coverage Report is activated shown as below:

![image016](https://user-images.githubusercontent.com/558905/37434297-86dbeb4a-27b5-11e8-9f25-d420080f6aa3.png)
![image017](https://user-images.githubusercontent.com/558905/37434298-86eb46c6-27b5-11e8-9a6a-6e75e013905a.jpg)
![image018](https://user-images.githubusercontent.com/558905/37434299-87070712-27b5-11e8-8366-27bbde780bfe.jpg)
![image019](https://user-images.githubusercontent.com/558905/37434300-8714aeee-27b5-11e8-9e36-bfb9389b932c.png)
![image020](https://user-images.githubusercontent.com/558905/37434301-874e62a6-27b5-11e8-8be5-b90f0652411b.jpg)
![image021](https://user-images.githubusercontent.com/558905/37434302-8763c236-27b5-11e8-8ce4-435efabbd94a.png)
![image022](https://user-images.githubusercontent.com/558905/37434303-877a83a4-27b5-11e8-8655-7cfd3422eb94.png)
![image023](https://user-images.githubusercontent.com/558905/37434304-87925236-27b5-11e8-9ef6-36d4f363a755.jpg)

Now lets update the SimpleGreeting Project pom file in Git to handle report metrics.

Open Eclipse.

In the Project Explorer, navigate to the SimpleGreeting project.

Double-click on the file pom.xml to open it.

On the lower edge of the editor panel, click on pom.xml to select the XML view of the file.

```xml
...
<build>
<plugins>

<plugin>
<groupId>org.codehaus.mojo</groupId>
<artifactId>cobertura-maven-plugin</artifactId>
<version>2.5</version>
<configuration>
<formats>
<format>html</format>
<format>xml</format>
</formats>
</configuration>
</plugin>

<plugin>
<groupId>org.apache.maven.plugins</groupId>
<artifactId>maven-compiler-plugin</artifactId>
<version>2.3.2</version>
<configuration>
<source>1.7</source>
<target>1.7</target>
</configuration>
</plugin>
</plugins>
</build>

<reporting>
<plugins>
<plugin>
<groupId>org.codehaus.mojo</groupId>
<artifactId>cobertura-maven-plugin</artifactId>
</plugin>
</plugins>
</reporting>

</project>
```

Great! Now, save and close the file.
