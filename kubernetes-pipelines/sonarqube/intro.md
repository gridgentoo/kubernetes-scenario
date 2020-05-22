# SonarQube on Kubernetes #

![SonarQube](/javajon/courses/kubernetes-pipelines/sonarqube/assets/sonarqube.png "Code Analysis with SonarQube on Kubernetes.")

> [SonarQube](https://www.sonarqube.com) is an open source platform developed by SonarSource for continuous inspection of code quality to perform automatic reviews with static analysis of code to detect bugs, code smells, and security vulnerabilities on 27+ programming languages. SonarQube offers reports on duplicated code, coding standards, unit tests, code coverage, code complexity, comments, bugs, and security vulnerabilities. [-- Wikipedia](https://en.wikipedia.org/wiki/sonarqube)

Setting up your SonarQube services as fragile [snowflakes](https://martinfowler.com/bliki/SnowflakeServer.html) is both common and not a recommended technique. Any developer should be able to quickly start a personal SonarQube service as well as rely on a team's service that matches the same behaviors. The latest SonarQube version, its plugins, and its configurations should also be easily adjustable. Your software development lifecycle processes (SDLC) should embrace the versioned configuration and deployment of SonarQube across a variety of [cattle (not pets)](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/) targets.

Follow these instructions to set up a personal [SonarQube engine and dashboard](https://www.sonarqube.org). With this, you have a strong, static code analysis tool backing your code all before you submit your work for a pull request. Within SonarQube there are plugins such as [Checkstyle](http://checkstyle.sourceforge.net/), [PMD](https://pmd.github.io/) and [Findbugs](http://findbugs.sourceforge.net/). The Findbugs plugin includes rules for vulnerabilities such as the [OWASP top 10](http://find-sec-bugs.github.io).

You will learn how:

- to install SonarQube onto Kubernetes
- to use Helm to install SonarQube
- to configure SonarQube plugins with the chart
- to access the SonarQube Dashboard
- to analyze code and inspect results with a Gradle plugin
