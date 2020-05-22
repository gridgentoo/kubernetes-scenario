The 4th factor (Backing services) of the [Twelve-Factor App Methodology](https://en.wikipedia.org/wiki/Twelve-Factor_App_methodology) states:

> The code for a twelve-factor app makes no distinction between local and third party services. To the app, both are attached resources, accessed via a URL or other locator/credentials stored in the config.

In the following steps you will learn:

- how your containerized application can find and call other services,
- how DNS providers can plug themselves into the cluster,
- how service discovery works in Kubernetes.
