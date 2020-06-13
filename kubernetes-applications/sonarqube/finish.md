# Conclusion #

Most developers who know about static code analysis know about SonarQube. While each language typically has specific linting and code analysis tools, SonarQube offers unifying tools for many languages and teams. Additionally, SonarQube with its database offers the additional dimension of time to trend your metrics over time.

This tutorial shows how you can easily use Kubernetes as a place to host a highly available server for you and your team.

## Lessons Learned ##

With these steps you have learned how to:

- &#x2714; install SonarQube onto Kubernetes
- &#x2714; use Helm to install SonarQube
- &#x2714; configure SonarQube plugins with the chart
- &#x2714; access the SonarQube Dashboard
- &#x2714; analyze code and inspect results with a Gradle plugin

## Additional Information ##

* Visit the No Fluff Just Stuff [tour](https://nofluffjuststuff.com) and see this example in action. [Code Analysis and Team Culture](https://www.nofluffjuststuff.com/conference/speaker/jonathan_johnson)
* [SonarQube integration](https://www.sonarsource.com/why-us/integration/)
* [SonarCloud Nemo](https://sonarcloud.io/projects?sort=-analysis_date), SonarQube continuous analysis reporting of many open source projects.
* Understand more about the stable Helm chart for using [SonarQube on Kubernetes](https://github.com/kubernetes/charts/tree/master/stable/sonarqube)
* Intellij's plugin for SonarQube, [SonarLint plugin](https://www.sonarlint.org/intellij/howto.html)
* [Shift left](https://martinfowler.com/articles/rise-test-impact-analysis.html#ShiftLeftAndRight)
* [Snowflakes](https://martinfowler.com/bliki/SnowflakeServer.html)
* [Cattle not pets](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/)
* [Checkstyle](http://checkstyle.sourceforge.net/)
* [PMD](https://pmd.github.io/)
* [Findbugs](http://findbugs.sourceforge.net/)
* Careful when upgrading SonarQube tag images or its plugins. It can be dependency hell with a complex matrix. If your container is failing it's due to mismatched versions.

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
