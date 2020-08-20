Once the plugins have been installed, you can configure how pipelines uses Git and Maven to download and build a hello world application. Let us start with Maven:

#### Task: Configure Maven Plugin

This step configures the Maven plugin.

1\. Once again, select **Manage Jenkins**.<br>

2\. Select **Global Tool Configuration**.<br>

3\. At the bottom, there is a button called **Add Maven**, in the "Maven installations..." section. Click it.<br>

4\. Choose the name **M3**.<br>

5\. Click the **Install automatically** checkbox and keep the option **Install from Apache** with version 3.5.0.<br>

6\. Click **Apply**  at the bottom of the page.


Jenkins Pipelines are now ready to use Maven.
